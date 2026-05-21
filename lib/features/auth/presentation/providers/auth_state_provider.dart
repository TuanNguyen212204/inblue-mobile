import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class AuthState {
  const AuthState({required this.isAuthenticated});

  final bool isAuthenticated;
}

final authStateProvider = Provider<AuthState>((ref) {
  final session = ref.watch(authNotifierProvider).valueOrNull;
  return AuthState(
    isAuthenticated: session != null && session.isLoggedIn && !session.isExpired,
  );
});
