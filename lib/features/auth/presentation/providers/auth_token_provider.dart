import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/storage/secure_storage_service.dart';

/// In-memory JWT mirror for Dio interceptor (hydrated on app start).
final authTokenProvider = StateProvider<String?>((ref) => null);

final hydrateAuthTokenProvider = FutureProvider<void>((ref) async {
  final token = await ref.read(secureStorageProvider).readJwt();
  ref.read(authTokenProvider.notifier).state = token;
});
