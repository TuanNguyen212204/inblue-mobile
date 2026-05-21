class PracticeSet {
  PracticeSet({
    this.id,
    this.practiceSetName,
    this.objective,
    this.startDate,
    this.interviewSessionId,
  });

  final int? id;
  final String? practiceSetName;
  final String? objective;
  final String? startDate;
  final int? interviewSessionId;

  factory PracticeSet.fromJson(Map<String, dynamic> json) => PracticeSet(
        id: (json['id'] as num?)?.toInt(),
        practiceSetName: json['practiceSetName'] as String?,
        objective: json['objective'] as String?,
        startDate: json['startDate'] as String?,
        interviewSessionId: (json['interviewSessionId'] as num?)?.toInt(),
      );
}
