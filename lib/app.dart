import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/router/app_router.dart';
import 'package:inblue_mobile/design_system/theme/app_theme.dart';
import 'package:inblue_mobile/core/providers/theme_mode_provider.dart';
import 'package:inblue_mobile/core/providers/app_settings_provider.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class InBlueApp extends ConsumerWidget {
  const InBlueApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authNotifierProvider);
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    final appSettings = ref.watch<AppSettings>(appSettingsProvider);

    return MaterialApp.router(
      title: 'InBlue',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(typographyScale: appSettings.fontSizeScale),
      darkTheme: AppTheme.dark(typographyScale: appSettings.fontSizeScale),
      themeMode: themeMode,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1 + appSettings.fontSizeScale / 16),
          ),
          child: child!,
        );
      },
      routerConfig: router,
    );
  }
}
