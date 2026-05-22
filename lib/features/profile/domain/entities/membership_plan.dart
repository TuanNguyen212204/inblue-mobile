import 'package:inblue_mobile/core/utils/json_coercion.dart';

class MembershipPlan {
  MembershipPlan({
    required this.id,
    required this.name,
    this.price = 0,
    this.maxAiInterview = 0,
    this.maxPracticeSets = 0,
    this.maxQuizSets = 0,
    this.durationDays = 0,
  });

  final int id;
  final String name;
  final double price;
  final int maxAiInterview;
  final int maxPracticeSets;
  final int maxQuizSets;
  final int durationDays;

  factory MembershipPlan.fromJson(Map<String, dynamic> json) => MembershipPlan(
        id: JsonCoercion.asInt(json['id']) ?? 0,
        name: (json['name'] as String? ?? '').toUpperCase(),
        price: JsonCoercion.asDouble(json['price']) ?? 0,
        maxAiInterview: JsonCoercion.asInt(json['max_ai_interview']) ??
            JsonCoercion.asInt(json['maxAiInterview']) ??
            0,
        maxPracticeSets: JsonCoercion.asInt(json['max_practice_sets']) ??
            JsonCoercion.asInt(json['maxPracticeSets']) ??
            0,
        maxQuizSets: JsonCoercion.asInt(json['max_quiz_sets']) ??
            JsonCoercion.asInt(json['maxQuizSets']) ??
            0,
        durationDays: JsonCoercion.asInt(json['durationDays']) ?? 0,
      );

  static const visibleNames = {'FREE', 'NEW', 'BASIC', 'PREMIUM'};
}

class UserSubscription {
  UserSubscription({
    this.planName,
    this.price = 0,
    this.aiInterviewRemaining = 0,
    this.practiceSetRemaining = 0,
    this.quizSetRemaining = 0,
    this.expiredAt,
    this.active = false,
  });

  final String? planName;
  final double price;
  final int aiInterviewRemaining;
  final int practiceSetRemaining;
  final int quizSetRemaining;
  final String? expiredAt;
  final bool active;

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      UserSubscription(
        planName: json['planName'] as String?,
        price: JsonCoercion.asDouble(json['price']) ?? 0,
        aiInterviewRemaining:
            JsonCoercion.asInt(json['aiInterviewRemaining']) ?? 0,
        practiceSetRemaining:
            JsonCoercion.asInt(json['practiceSetRemaining']) ?? 0,
        quizSetRemaining: JsonCoercion.asInt(json['quizSetRemaining']) ?? 0,
        expiredAt: json['expiredAt'] as String?,
        active: JsonCoercion.asBool(json['active']) ?? false,
      );
}
