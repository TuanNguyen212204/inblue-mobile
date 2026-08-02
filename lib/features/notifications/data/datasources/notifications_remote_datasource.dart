import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/features/notifications/domain/entities/app_notification.dart';

class NotificationsRemoteDataSource {
  NotificationsRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<AppNotification>> getNotifications(int userId) async {
    try {
      final res = await _dio.get<dynamic>(ApiPaths.notifications(userId));
      final list = _unwrapList(res.data);
      return list
          .map((e) => AppNotification.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<void> markAsRead(int notificationId) async {
    try {
      await _dio.put<dynamic>(ApiPaths.notificationMarkRead(notificationId));
    } catch (_) {}
  }

  List<dynamic> _unwrapList(dynamic data) {
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
