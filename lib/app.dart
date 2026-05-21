import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/router/app_router.dart';
import 'package:inblue_mobile/design_system/theme/app_theme.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_token_provider.dart';

class InBlueApp extends ConsumerWidget {
  const InBlueApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(hydrateAuthTokenProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'InBlue',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}
