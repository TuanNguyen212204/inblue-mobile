import 'package:equatable/equatable.dart';
import 'package:inblue_mobile/features/auth/domain/entities/auth_user.dart';

class AuthSession extends Equatable {
  const AuthSession({
    required this.isLoggedIn,
    required this.user,
    required this.token,
    required this.expiresAt,
  });

  final bool isLoggedIn;
  final AuthUser user;
  final String token;
  final int expiresAt;

  bool get isExpired =>
      DateTime.now().millisecondsSinceEpoch >= expiresAt;

  factory AuthSession.fromJson(Map<String, dynamic> json) => AuthSession(
        isLoggedIn: json['isLoggedIn'] as bool? ?? false,
        user: AuthUser.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String,
        expiresAt: (json['expiresAt'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'isLoggedIn': isLoggedIn,
        'user': user.toJson(),
        'token': token,
        'expiresAt': expiresAt,
      };

  @override
  List<Object?> get props => [isLoggedIn, user, token, expiresAt];
}
