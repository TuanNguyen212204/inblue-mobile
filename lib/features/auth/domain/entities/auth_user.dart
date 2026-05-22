import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  const AuthUser({
    required this.id,
    required this.email,
    this.name,
    this.role = 'USER',
  });

  final int id;
  final String email;
  final String? name;
  final String role;

  /// REST `GET /api/users/find-by-id/{id}` and login payloads.
  factory AuthUser.fromApiJson(Map<String, dynamic> json) => AuthUser(
        id: (json['id'] as num?)?.toInt() ?? 0,
        email: readEmailFrom(json),
        name: readDisplayNameFrom(json),
        role: json['role'] as String? ?? 'USER',
      );

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser.fromApiJson(json);

  /// Human-readable label — never falls back to raw user id.
  String get displayName {
    final n = name?.trim();
    if (n != null && n.isNotEmpty) return n;
    if (email.contains('@')) {
      final local = email.split('@').first;
      if (local.isNotEmpty) return local;
    }
    return 'Ứng viên';
  }

  static String readEmailFrom(Map<String, dynamic> json) {
    final raw = json['email'] as String?;
    if (raw != null && raw.contains('@')) return raw.trim();
    return '';
  }

  static String? readDisplayNameFrom(Map<String, dynamic> json) {
    for (final key in ['fullName', 'full_name', 'name', 'displayName']) {
      final v = json[key];
      if (v is String && v.trim().isNotEmpty) return v.trim();
    }
    final first = json['firstName'] ?? json['first_name'];
    final last = json['lastName'] ?? json['last_name'];
    if (first is String || last is String) {
      return '${first ?? ''} ${last ?? ''}'.trim();
    }
    return null;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'role': role,
      };

  @override
  List<Object?> get props => [id, email, name, role];
}
