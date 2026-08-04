class InterviewSession {
  InterviewSession({
    this.id,
    this.sessionKey,
    this.status,
    this.mode,
    this.domain,
    this.createdAt,
    this.completedAt,
    this.overallScore,
    this.result,
    this.resultDetail,
    this.targetRole,
    this.targetLevel,
    this.difficulty,
    this.durationMinutes,
    this.language,
    this.updatedAt,
  });

  final int? id;
  final String? sessionKey;
  final String? status;
  final String? mode;
  final String? domain;
  final String? createdAt;
  final String? completedAt;
  final double? overallScore;
  final String? result;
  final InterviewResultDetail? resultDetail;
  final String? targetRole;
  final String? targetLevel;
  final String? difficulty;
  final int? durationMinutes;
  final String? language;
  final String? updatedAt;

  bool get isInProgress => status == 'IN_PROGRESS';
  bool get isCompleted => status == 'COMPLETED';
  bool get isCancelled => status == 'CANCELLED';
  bool get isExpired =>
      status == 'EXPIRED' || (isInProgress && isInterviewSessionExpired(createdAt));
  bool get canViewResult => isCompleted && id != null;

  factory InterviewSession.fromJson(Map<String, dynamic> json) {
    final candidateProfile = json['candidateProfile'] as Map<String, dynamic>?;
    final sessionConfig = json['sessionConfig'] as Map<String, dynamic>?;

    return InterviewSession(
      id: (json['id'] as num?)?.toInt(),
      sessionKey: json['sessionKey'] as String?,
      status: json['status'] as String?,
      mode: json['mode'] as String? ?? sessionConfig?['interview_mode'] as String?,
      domain: json['domain'] as String? ?? sessionConfig?['domain'] as String?,
      createdAt: json['createdAt'] as String?,
      completedAt: json['completedAt'] as String?,
      overallScore: (json['overallScore'] as num?)?.toDouble(),
      result: json['result'] as String?,
      resultDetail: json['resultDetail'] != null
          ? InterviewResultDetail.fromJson(
              json['resultDetail'] as Map<String, dynamic>,
            )
          : null,
      targetRole: json['targetRole'] as String? ??
          candidateProfile?['targetRole'] as String?,
      targetLevel: json['targetLevel'] as String? ??
          candidateProfile?['targetLevel'] as String?,
      difficulty: json['difficulty'] as String? ??
          sessionConfig?['difficulty'] as String?,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ??
          (sessionConfig?['duration_minutes'] as num?)?.toInt(),
      language: json['language'] as String? ??
          sessionConfig?['language'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}

class InterviewResultDetail {
  InterviewResultDetail({
    this.aiOverviewFeedback,
    this.improvementPlan,
    this.history,
  });

  final String? aiOverviewFeedback;
  final String? improvementPlan;
  final List<QaResult>? history;

  factory InterviewResultDetail.fromJson(Map<String, dynamic> json) {
    return InterviewResultDetail(
      aiOverviewFeedback: json['aiOverviewFeedback'] as String?,
      improvementPlan: json['improvementPlan'] as String?,
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => QaResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class QaResult {
  QaResult({
    this.questionText,
    this.answerText,
    this.feedback,
    this.score,
    this.suggestion,
    this.behavioralWarnings,
  });

  final String? questionText;
  final String? answerText;
  final String? feedback;
  final double? score;
  final String? suggestion;
  final List<String>? behavioralWarnings;

  factory QaResult.fromJson(Map<String, dynamic> json) => QaResult(
        questionText: json['questionText'] as String?,
        answerText: json['answerText'] as String?,
        feedback: json['feedback'] as String?,
        score: (json['score'] as num?)?.toDouble(),
        suggestion: json['suggestion'] as String?,
        behavioralWarnings: (json['behavioralWarnings'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
      );
}

const sessionExpiryMs = 3600000;

bool isInterviewSessionExpired(String? createdAtIso) {
  if (createdAtIso == null) return true;
  final created = DateTime.tryParse(createdAtIso);
  if (created == null) return true;
  return DateTime.now().difference(created).inMilliseconds >= sessionExpiryMs;
}
