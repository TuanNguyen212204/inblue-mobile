import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_token_provider.dart';

class AuthState {
  const AuthState({required this.isAuthenticated});

  final bool isAuthenticated;
}

final authStateProvider = Provider<AuthState>((ref) {
  final token = ref.watch(authTokenProvider);
  return AuthState(isAuthenticated: token != null && token.isNotEmpty);
});
