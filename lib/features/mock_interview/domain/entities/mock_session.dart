class MockSession {
  MockSession({
    this.id,
    this.roomName,
    this.userId,
    this.userId2,
    this.roomUrl,
    this.joinTime,
    this.status,
    this.duration,
    this.totalPrice,
    this.recordUrl,
  });

  final int? id;
  final String? roomName;
  final int? userId;
  final int? userId2;
  final String? roomUrl;
  final String? joinTime;
  final String? status;
  final int? duration;
  final double? totalPrice;
  final String? recordUrl;

  factory MockSession.fromJson(Map<String, dynamic> json) => MockSession(
        id: (json['id'] as num?)?.toInt(),
        roomName: json['roomName'] as String?,
        userId: (json['userId'] as num?)?.toInt(),
        userId2: (json['userId2'] as num?)?.toInt(),
        roomUrl: json['roomUrl'] as String?,
        joinTime: json['joinTime'] as String?,
        status: json['status'] as String?,
        duration: (json['duration'] as num?)?.toInt(),
        totalPrice: (json['totalPrice'] as num?)?.toDouble(),
        recordUrl: json['recordUrl'] as String?,
      );

  bool canJoin(DateTime now) {
    if (status != 'PAID' && status != 'ONGOING') return false;
    if (roomUrl == null || roomUrl!.isEmpty) return false;
    if (joinTime == null) return true;
    final jt = DateTime.tryParse(joinTime!);
    if (jt == null) return true;
    return !now.isBefore(jt);
  }
}
