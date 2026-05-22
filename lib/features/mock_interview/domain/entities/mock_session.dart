import 'package:inblue_mobile/core/utils/json_coercion.dart';

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
        id: JsonCoercion.asInt(json['id']),
        roomName: json['roomName'] as String?,
        userId: JsonCoercion.asInt(json['userId']),
        userId2: JsonCoercion.asInt(json['userId2']),
        roomUrl: json['roomUrl'] as String?,
        joinTime: json['joinTime'] as String?,
        status: json['status'] as String?,
        duration: JsonCoercion.asInt(json['duration']),
        totalPrice: JsonCoercion.asDouble(json['totalPrice']),
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
