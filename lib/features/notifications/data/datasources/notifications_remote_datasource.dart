import 'package:dio/dio.dart';
import 'package:inblue_api/inblue_api.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/features/notifications/domain/entities/app_notification.dart';

class NotificationsRemoteDataSource {
  NotificationsRemoteDataSource(
    this._dio, [
    NotificationControllerApi? notificationApi,
  ]) : _notificationApi =
            notificationApi ?? NotificationControllerApi(_dio, standardSerializers);

  final Dio _dio;
  final NotificationControllerApi _notificationApi;

  Future<List<AppNotification>> getNotifications(int userId) async {
    try {
      final res = await _notificationApi.getAllNotifications(id: userId);
      if (res.data != null) {
        return res.data!
            .map((n) => AppNotification.fromJson({
                  'id': n.id,
                  'title': n.title,
                  'message': n.message,
                  'read': n.isRead,
                  'createdAt': n.createAt?.toIso8601String(),
                }))
            .toList();
      }
    } catch (_) {}

    try {
      final res = await _dio.get<dynamic>(ApiPaths.notifications(userId));
      final list = _parseList(res.data);
      return list
          .map((e) => AppNotification.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<void> markAsRead(int notificationId) async {
    try {
      await _notificationApi.checkRead(notificationId: notificationId);
      return;
    } catch (_) {}

    try {
      await _dio.put<dynamic>(ApiPaths.notificationMarkRead(notificationId));
    } catch (_) {}
  }

  Future<void> markAllAsRead() async {
    try {
      await _dio.put<dynamic>('/api/notifications/mark-all-read');
    } catch (_) {}
  }

  List<dynamic> _parseList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      for (final key in ['data', 'content', 'items', 'notifications']) {
        final nested = data[key];
        if (nested is List) return nested;
      }
    }
    return const [];
  }
}
