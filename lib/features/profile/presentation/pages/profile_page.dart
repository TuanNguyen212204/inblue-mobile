import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/providers/theme_mode_provider.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authNotifierProvider).valueOrNull;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hồ sơ')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          if (session != null)
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(session.user.name ?? session.user.email),
                subtitle: Text(session.user.email),
              ),
            ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Giao diện'),
                  subtitle: Text('Light / Dark / System'),
                ),
                SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(value: ThemeMode.light, label: Text('Sáng')),
                    ButtonSegment(value: ThemeMode.dark, label: Text('Tối')),
                    ButtonSegment(value: ThemeMode.system, label: Text('Hệ thống')),
                  ],
                  selected: {themeMode},
                  onSelectionChanged: (s) => ref
                      .read(themeModeProvider.notifier)
                      .setThemeMode(s.first),
                ),
                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton.tonal(
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).logout();
              if (context.mounted) context.go(RoutePaths.login);
            },
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}
