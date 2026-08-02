import 'package:inblue_mobile/core/utils/json_coercion.dart';

class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.body,
    this.isRead = false,
    this.createdAt,
    this.type,
  });

  final int id;
  final String title;
  final String body;
  final bool isRead;
  final String? createdAt;
  final String? type;

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    final title =
        json['title'] as String? ?? json['name'] as String? ?? 'Thông báo';
    final body = json['content'] as String? ??
        json['message'] as String? ??
        json['body'] as String? ??
        '';
    final isRead = JsonCoercion.asBool(json['checkRead']) ??
        JsonCoercion.asBool(json['isRead']) ??
        JsonCoercion.asBool(json['read']) ??
        false;

    return AppNotification(
      id: JsonCoercion.asInt(json['id']) ?? 0,
      title: title,
      body: body,
      isRead: isRead,
      createdAt: json['createdAt'] as String? ?? json['createdDate'] as String?,
      type: json['type'] as String?,
    );
  }

  String get formattedTime {
    if (createdAt == null || createdAt!.isEmpty) return '';
    try {
      final dt = DateTime.parse(createdAt!).toLocal();
      final diff = DateTime.now().difference(dt);
      if (diff.inDays > 0) return '${diff.inDays} ngày trước';
      if (diff.inHours > 0) return '${diff.inHours} giờ trước';
      if (diff.inMinutes > 0) return '${diff.inMinutes} phút trước';
      return 'Vừa xong';
    } catch (_) {
      return createdAt!;
    }
  }
}
