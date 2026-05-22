import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/providers/theme_mode_provider.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';

Future<void> showAccountSettingsSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) => const _AccountSettingsSheet(),
  );
}

class _AccountSettingsSheet extends ConsumerWidget {
  const _AccountSettingsSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        bottom + AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Cài đặt',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Giao diện',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppSpacing.sm),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.light,
                icon: Icon(Icons.light_mode_outlined, size: 18),
                label: Text('Sáng'),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                icon: Icon(Icons.dark_mode_outlined, size: 18),
                label: Text('Tối'),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                icon: Icon(Icons.settings_brightness_outlined, size: 18),
                label: Text('Hệ thống'),
              ),
            ],
            selected: {themeMode},
            onSelectionChanged: (s) =>
                ref.read(themeModeProvider.notifier).setThemeMode(s.first),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton.tonal(
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (dCtx) => AlertDialog(
                  title: const Text('Đăng xuất'),
                  content: const Text(
                    'Bạn có chắc muốn đăng xuất khỏi ứng dụng?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dCtx, false),
                      child: const Text('Hủy'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(dCtx, true),
                      child: const Text('Đăng xuất'),
                    ),
                  ],
                ),
              );
              if (confirmed != true || !context.mounted) return;
              Navigator.pop(context);
              await ref.read(authNotifierProvider.notifier).logout();
              ref.invalidate(accountNotifierProvider);
              // GoRouter redirect sends user to /login — do not context.go here
              // (avoids race while auth flag still true → bounce back to /user).
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout_rounded, size: 20),
                SizedBox(width: 8),
                Text('Đăng xuất'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
