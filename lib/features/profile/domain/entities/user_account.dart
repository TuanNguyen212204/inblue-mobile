import 'package:equatable/equatable.dart';
import 'package:inblue_mobile/core/utils/json_coercion.dart';

/// Full user account from `GET /api/users/{id}` — parity web `User`.
class UserAccount extends Equatable {
  const UserAccount({
    required this.id,
    required this.email,
    this.name,
    this.role = 'USER',
    this.avatarUrl,
    this.publicId,
    this.university,
    this.major,
    this.cvUrl,
    this.cvPublicId,
    this.walletBalance = 0,
    this.membershipPlanName,
  });

  final int id;
  final String email;
  final String? name;
  final String role;
  final String? avatarUrl;
  final String? publicId;
  final String? university;
  final String? major;
  final String? cvUrl;
  final String? cvPublicId;
  final double walletBalance;
  final String? membershipPlanName;

  String get displayName {
    final n = name?.trim();
    if (n != null && n.isNotEmpty) return n;
    return email.split('@').first;
  }

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    final plan = json['membershipPlan'];
    String? planName;
    if (plan is Map) {
      planName = plan['name'] as String?;
    }
    return UserAccount(
      id: JsonCoercion.asInt(json['id']) ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String?,
      role: json['role'] as String? ?? 'USER',
      avatarUrl: json['avatarUrl'] as String?,
      publicId: json['public_id'] as String? ?? json['publicId'] as String?,
      university: json['university'] as String?,
      major: json['major'] as String?,
      cvUrl: json['cvUrl'] as String?,
      cvPublicId: json['cv_public_id'] as String? ?? json['cvPublicId'] as String?,
      walletBalance: JsonCoercion.asDouble(json['walletBalance']) ?? 0,
      membershipPlanName: planName,
    );
  }

  UserAccount copyWith({
    String? name,
    String? avatarUrl,
    String? publicId,
    String? university,
    String? major,
    String? cvUrl,
    String? cvPublicId,
    double? walletBalance,
    String? membershipPlanName,
  }) =>
      UserAccount(
        id: id,
        email: email,
        name: name ?? this.name,
        role: role,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        publicId: publicId ?? this.publicId,
        university: university ?? this.university,
        major: major ?? this.major,
        cvUrl: cvUrl ?? this.cvUrl,
        cvPublicId: cvPublicId ?? this.cvPublicId,
        walletBalance: walletBalance ?? this.walletBalance,
        membershipPlanName: membershipPlanName ?? this.membershipPlanName,
      );

  Map<String, dynamic> toUpdateJson() => {
        'id': id,
        'name': name,
        'university': university,
        'major': major,
        'public_id': publicId ?? '',
        'cv_public_id': cvPublicId ?? '',
      };

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        avatarUrl,
        university,
        major,
        walletBalance,
      ];
}

/// Parity web `MAJOR_OPTIONS`.
abstract final class MajorOptions {
  static const values = ['CNTT', 'Marketing'];
}
