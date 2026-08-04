class PracticeSet {
  PracticeSet({
    this.id,
    this.practiceSetName,
    this.objective,
    this.startDate,
    this.totalDateNumber,
    this.interviewSessionId,
  });

  final int? id;
  final String? practiceSetName;
  final String? objective;
  final String? startDate;
  final int? totalDateNumber;
  final int? interviewSessionId;

  factory PracticeSet.fromJson(Map<String, dynamic> json) => PracticeSet(
        id: (json['id'] as num?)?.toInt(),
        practiceSetName: json['practiceSetName'] as String?,
        objective: json['objective'] as String?,
        startDate: json['startDate'] as String?,
        totalDateNumber: (json['totalDateNumber'] as num?)?.toInt(),
        interviewSessionId: (json['interviewSessionId'] as num?)?.toInt(),
      );
}
