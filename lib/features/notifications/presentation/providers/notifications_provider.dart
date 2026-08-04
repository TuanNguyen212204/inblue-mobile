import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/notifications/data/datasources/notifications_remote_datasource.dart';
import 'package:inblue_mobile/features/notifications/domain/entities/app_notification.dart';

import 'package:inblue_mobile/core/network/api_client_provider.dart';

final notificationsRemoteDataSourceProvider =
    Provider<NotificationsRemoteDataSource>((ref) {
  return NotificationsRemoteDataSource(
    ref.watch(dioProvider),
    ref.watch(notificationControllerApiProvider),
  );
});

final notificationsProvider =
    FutureProvider<List<AppNotification>>((ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return const [];
  final ds = ref.watch(notificationsRemoteDataSourceProvider);
  return ds.getNotifications(userId);
});
