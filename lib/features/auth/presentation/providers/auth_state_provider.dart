import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class AuthState {
  const AuthState({required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState && isAuthenticated == other.isAuthenticated;

  @override
  int get hashCode => isAuthenticated.hashCode;
}

/// Primitive — profile refresh must NOT recreate [GoRouter].
final isAuthenticatedProvider = Provider<bool>((ref) {
  final session = ref.watch(authNotifierProvider).valueOrNull;
  return session != null && session.isLoggedIn && !session.isExpired;
});

final authStateProvider = Provider<AuthState>((ref) {
  return AuthState(isAuthenticated: ref.watch(isAuthenticatedProvider));
});
