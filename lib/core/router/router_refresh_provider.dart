import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/router/router_refresh_notifier.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_state_provider.dart';

final routerRefreshNotifierProvider = Provider<RouterRefreshNotifier>((ref) {
  final notifier = RouterRefreshNotifier();
  ref.listen(isAuthenticatedProvider, (_, __) => notifier.notifyRouter());
  ref.onDispose(notifier.dispose);
  return notifier;
});
