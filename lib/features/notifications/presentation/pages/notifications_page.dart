import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/components/app_compact_header.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: AppCompactHeader(
              title: 'Thông báo',
              subtitle: 'Cập nhật lịch phỏng vấn & thanh toán',
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              100,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _EmptyNotifications()
                    .animate()
                    .fadeIn(duration: 450.ms)
                    .slideY(begin: 0.05, curve: Curves.easeOutCubic),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppGlassSurface(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: scheme.primary.withValues(alpha: 0.12),
            ),
            child: Icon(
              Icons.notifications_active_outlined,
              size: 36,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Chưa có thông báo mới',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Khi mentor duyệt lịch hoặc thanh toán hoàn tất, bạn sẽ thấy tại đây.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

/// Premium notification row — ready when REST/STOMP is wired.
class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.title,
    required this.body,
    required this.timeLabel,
    super.key,
    this.isRead = false,
    this.icon = Icons.info_outline_rounded,
  });

  final String title;
  final String body;
  final String timeLabel;
  final bool isRead;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.md),
      opacity: isRead ? 0.5 : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: scheme.primary.withValues(alpha: isRead ? 0.08 : 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: scheme.primary, size: 22),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: isRead ? FontWeight.w500 : FontWeight.w700,
                              fontSize: 15,
                            ),
                      ),
                    ),
                    if (!isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: scheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 6),
                Text(
                  timeLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
