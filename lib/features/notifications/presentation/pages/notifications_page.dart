import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_compact_header.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/dashboard/presentation/widgets/shell_tab_body.dart';
import 'package:inblue_mobile/features/notifications/domain/entities/app_notification.dart';
import 'package:inblue_mobile/features/notifications/presentation/providers/notifications_provider.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  String _filter = 'ALL'; // ALL | UNREAD | READ

  Future<void> _markAllAsRead() async {
    try {
      await ref.read(notificationsRemoteDataSourceProvider).markAllAsRead();
      ref.invalidate(notificationsProvider);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã đánh dấu tất cả thông báo là đã đọc'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (_) {}
  }

  void _showDetailModal(BuildContext context, AppNotification item) {
    if (!item.isRead) {
      ref.read(notificationsRemoteDataSourceProvider).markAsRead(item.id);
      ref.invalidate(notificationsProvider);
    }
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              item.formattedTime,
              style: Theme.of(ctx).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            const Divider(height: 24),
            Text(
              item.body,
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notificationsAsync = ref.watch(notificationsProvider);

    return ShellTabBody(
      child: RefreshIndicator(
        onRefresh: () async => ref.invalidate(notificationsProvider),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppCompactHeader(
                title: 'Thông báo',
                subtitle: 'Cập nhật lịch phỏng vấn & thanh toán',
                actions: [
                  IconButton(
                    tooltip: 'Đánh dấu tất cả đã đọc',
                    icon: const Icon(Icons.done_all_rounded),
                    onPressed: _markAllAsRead,
                  ),
                  IconButton(
                    tooltip: 'Tải lại',
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => ref.invalidate(notificationsProvider),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: notificationsAsync.when(
                data: (items) {
                  final total = items.length;
                  final unread = items.where((i) => !i.isRead).length;
                  final read = items.where((i) => i.isRead).length;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _StatBadge(label: 'Tất cả', count: total, color: Colors.blue),
                            const SizedBox(width: AppSpacing.xs),
                            _StatBadge(label: 'Chưa đọc', count: unread, color: Colors.orange),
                            const SizedBox(width: AppSpacing.xs),
                            _StatBadge(label: 'Đã đọc', count: read, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        SegmentedButton<String>(
                          segments: const [
                            ButtonSegment(value: 'ALL', label: Text('Tất cả')),
                            ButtonSegment(value: 'UNREAD', label: Text('Chưa đọc')),
                            ButtonSegment(value: 'READ', label: Text('Đã đọc')),
                          ],
                          selected: {_filter},
                          onSelectionChanged: (val) => setState(() => _filter = val.first),
                        ),
                        const SizedBox(height: AppSpacing.md),
                      ],
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                0,
                AppSpacing.md,
                ShellTabLayout.bottomInset,
              ),
              sliver: notificationsAsync.when(
                loading: () => SliverList(
                  delegate: SliverChildListDelegate([
                    const AppShimmerCard(height: 80),
                    const SizedBox(height: AppSpacing.sm),
                    const AppShimmerCard(height: 80),
                    const SizedBox(height: AppSpacing.sm),
                    const AppShimmerCard(height: 80),
                  ]),
                ),
                error: (_, __) => SliverList(
                  delegate: SliverChildListDelegate([
                    _EmptyNotifications(),
                  ]),
                ),
                data: (rawItems) {
                  final items = rawItems.where((i) {
                    if (_filter == 'UNREAD') return !i.isRead;
                    if (_filter == 'READ') return i.isRead;
                    return true;
                  }).toList();

                  if (items.isEmpty) {
                    return SliverList(
                      delegate: SliverChildListDelegate([
                        _EmptyNotifications(),
                      ]),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: InkWell(
                            onTap: () => _showDetailModal(context, item),
                            child: NotificationTile(
                              title: item.title,
                              body: item.body,
                              timeLabel: item.formattedTime,
                              isRead: item.isRead,
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 300.ms, delay: (index * 40).ms)
                              .slideY(begin: 0.04),
                        );
                      },
                      childCount: items.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: color.withValues(alpha: 0.8)),
            ),
          ],
        ),
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
      opacity: isRead ? 0.6 : null,
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
                if (timeLabel.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    timeLabel,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: scheme.onSurface.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
