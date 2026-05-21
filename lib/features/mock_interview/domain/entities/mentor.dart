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
        id: (json['id'] as num?)?.toInt(),
        name: json['name'] as String?,
        email: json['email'] as String?,
        bio: json['bio'] as String?,
        avatarUrl: json['avatarUrl'] as String?,
        expertise: json['expertise'] as String?,
        yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
        pricePerMinute: (json['pricePerMinute'] as num?)?.toDouble(),
        averageRating: (json['averageRating'] as num?)?.toDouble(),
        totalSession: (json['totalSession'] as num?)?.toInt(),
        active: json['active'] as bool?,
      );
}
