import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/providers/app_settings_provider.dart';
import 'package:inblue_mobile/core/providers/theme_mode_provider.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
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
    final appSettings = ref.watch(appSettingsProvider);
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
            'Tài khoản',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Đổi mật khẩu'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pop(context);
                context.push(RoutePaths.changePassword);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
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
          Text(
            'Cỡ chữ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppSpacing.sm),
          SegmentedButton<double>(
            segments: const [
              ButtonSegment(
                value: -1,
                label: Text('Nhỏ'),
              ),
              ButtonSegment(
                value: 0,
                label: Text('Mặc định'),
              ),
              ButtonSegment(
                value: 2,
                label: Text('Lớn'),
              ),
            ],
            selected: {appSettings.fontSizeScale},
            onSelectionChanged: (s) =>
                ref.read(appSettingsProvider.notifier).setFontSizeScale(s.first),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Thông báo',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppSpacing.sm),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('Tắt thông báo'),
            subtitle: const Text('Ẩn toast và heads-up mới'),
            value: appSettings.notificationMute,
            onChanged: (v) => ref
                .read(appSettingsProvider.notifier)
                .setNotificationMute(v),
          ),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('Tắt âm thông báo'),
            subtitle: const Text('Giữ hiển thị nhưng không phát âm thanh'),
            value: appSettings.notificationSoundMute,
            onChanged: (v) => ref
                .read(appSettingsProvider.notifier)
                .setNotificationSoundMute(v),
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
