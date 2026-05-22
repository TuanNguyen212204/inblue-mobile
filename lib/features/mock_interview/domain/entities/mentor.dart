import 'package:inblue_mobile/core/utils/json_coercion.dart';

class Mentor {
  Mentor({
    this.id,
    this.name,
    this.email,
    this.bio,
    this.avatarUrl,
    this.expertise,
    this.yearsOfExperience,
    this.pricePerMinute,
    this.averageRating,
    this.totalSession,
    this.active,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? bio;
  final String? avatarUrl;
  final String? expertise;
  final int? yearsOfExperience;
  final double? pricePerMinute;
  final double? averageRating;
  final int? totalSession;
  final bool? active;

  factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
        id: JsonCoercion.asInt(json['id']),
        name: json['name'] as String?,
        email: json['email'] as String?,
        bio: json['bio'] as String?,
        avatarUrl: json['avatarUrl'] as String? ?? json['avatar'] as String?,
        expertise: json['expertise'] as String?,
        yearsOfExperience: JsonCoercion.asInt(json['yearsOfExperience']),
        pricePerMinute: JsonCoercion.asDouble(json['pricePerMinute']),
        averageRating: JsonCoercion.asDouble(json['averageRating']),
        totalSession: JsonCoercion.asInt(json['totalSession']),
        active: JsonCoercion.asBool(json['active']),
      );
}
