import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:inblue_mobile/core/storage/interview_session_storage.dart';
import 'package:inblue_mobile/core/storage/secure_storage_service.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_list_notifier.dart';
import 'package:inblue_mobile/features/auth/domain/entities/auth_session.dart';
import 'package:inblue_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_providers.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_token_provider.dart';

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, AuthSession?>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<AuthSession?> {
  @override
  Future<AuthSession?> build() async {
    final raw = await ref.read(secureStorageProvider).readAuthPayload();
    if (raw == null) return null;
    try {
      final session = AuthSession.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
      if (session.isExpired) {
        await _clear();
        return null;
      }
      ref.read(authTokenProvider.notifier).state = session.token;
      return _enrichUser(session);
    } catch (_) {
      await _clear();
      return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final token = await ref.read(authRemoteDataSourceProvider).login(
            email: email,
            password: password,
          );
      final session = _sessionFromToken(token);
      await ref.read(secureStorageProvider).writeJwt(token);
      await ref.read(secureStorageProvider).writeAuthPayload(
            jsonEncode(session.toJson()),
          );
      ref.read(authTokenProvider.notifier).state = token;
      return _enrichUser(session);
    });
  }

  /// Refresh display name/email from BE (e.g. Profile screen).
  Future<void> refreshUserProfile() async {
    final current = state.valueOrNull;
    if (current == null || current.user.id <= 0) return;
    try {
      final fresh =
          await ref.read(userRemoteDataSourceProvider).fetchById(current.user.id);
      final enriched = current.copyWith(user: fresh);
      await ref.read(secureStorageProvider).writeAuthPayload(
            jsonEncode(enriched.toJson()),
          );
      state = AsyncData(enriched);
    } catch (_) {
      // Keep cached session on network errors.
    }
  }

  Future<void> logout() async {
    await _clear();
    state = const AsyncData(null);
    ref.invalidate(aiInterviewListNotifierProvider);
  }

  AuthSession _sessionFromToken(String token) {
    final payload = JwtDecoder.decode(token);
    final expMs = JwtDecoder.getExpirationDate(token).millisecondsSinceEpoch;
    final id = _readId(payload);
    return AuthSession(
      isLoggedIn: true,
      token: token,
      expiresAt: expMs,
      user: AuthUser(
        id: id,
        email: AuthUser.readEmailFrom(payload),
        name: AuthUser.readDisplayNameFrom(payload),
        role: (payload['role'] ?? 'USER') as String,
      ),
    );
  }

  Future<AuthSession> _enrichUser(AuthSession session) async {
    final user = session.user;
    if (user.id <= 0) return session;
    final needsProfile = user.name == null ||
        user.name!.isEmpty ||
        !user.email.contains('@');
    if (!needsProfile) return session;

    try {
      final fresh = await ref.read(userRemoteDataSourceProvider).fetchById(user.id);
      final enriched = session.copyWith(user: fresh);
      await ref.read(secureStorageProvider).writeAuthPayload(
            jsonEncode(enriched.toJson()),
          );
      return enriched;
    } catch (_) {
      return session;
    }
  }

  int _readId(Map<String, dynamic> payload) {
    for (final key in ['id', 'userId', 'user_id', 'sub']) {
      final v = payload[key];
      if (v is int) return v;
      if (v is String) return int.tryParse(v) ?? 0;
    }
    return 0;
  }

  Future<void> _clear() async {
    await ref.read(secureStorageProvider).clearAll();
    await InterviewSessionStorage.clearAll();
    ref.read(authTokenProvider.notifier).state = null;
  }
}

final currentUserIdProvider = Provider<int?>((ref) {
  return ref.watch(authNotifierProvider).valueOrNull?.user.id;
});
