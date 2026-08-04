import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/domain/entities/jd_purchase.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_empty_state.dart';
import 'package:intl/intl.dart';

class JdPurchasesTab extends ConsumerWidget {
  const JdPurchasesTab({required this.purchases, super.key});

  final List<JdPurchase> purchases;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (purchases.isEmpty) {
      return AppEmptyState(
        title: 'Chưa có gói JD nào',
        subtitle: 'Lịch sử mua gói JD phỏng vấn sẽ hiển thị tại đây',
        icon: Icons.work_history_outlined,
        action: OutlinedButton(
          onPressed: () => ref.read(accountNotifierProvider.notifier).refresh(),
          child: const Text('Làm mới'),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(accountNotifierProvider.notifier).refresh(),
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        itemCount: purchases.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
        itemBuilder: (context, index) {
          final item = purchases[index];
          return _JdPurchaseTile(item: item)
              .animate()
              .fadeIn(delay: (index * 40).ms)
              .slideX(begin: 0.02);
        },
      ),
    );
  }
}

class _JdPurchaseTile extends StatelessWidget {
  const _JdPurchaseTile({required this.item});

  final JdPurchase item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final date = _formatDate(item.purchasedAt);

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Company Avatar / Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: item.companyLogoUrl != null && item.companyLogoUrl!.isNotEmpty
                    ? Image.network(
                        item.companyLogoUrl!,
                        width: 24,
                        height: 24,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.business_rounded,
                          color: scheme.primary,
                          size: 20,
                        ),
                      )
                    : Icon(
                        Icons.business_rounded,
                        color: scheme.primary,
                        size: 20,
                      ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.companyName != null && item.companyName!.isNotEmpty)
                      Text(
                        item.companyName!,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    Text(
                      item.jobTitle ?? 'Job Description',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              _buildStatusBadge(context, item.status),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          const Divider(height: 1),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.transactionCode != null || item.paymentMethod != null)
                    Text(
                      '${item.transactionCode ?? ''} ${item.paymentMethod ?? ''}'.trim(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (date.isNotEmpty)
                    Text(
                      'Ngày mua: $date',
                      style: theme.textTheme.bodySmall,
                    ),
                ],
              ),
              if (item.amount != null)
                Text(
                  ProfileUiUtils.formatVnd(item.amount!),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: scheme.primary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String? status) {
    final scheme = Theme.of(context).colorScheme;
    Color bg;
    Color fg;
    String label;

    switch (status?.toUpperCase()) {
      case 'USED':
        bg = Colors.green.shade50;
        fg = Colors.green.shade700;
        label = 'Đã dùng';
        break;
      case 'PURCHASED':
      case 'ACTIVE':
        bg = scheme.primaryContainer;
        fg = scheme.onPrimaryContainer;
        label = 'Khả dụng';
        break;
      case 'EXPIRED':
        bg = scheme.errorContainer;
        fg = scheme.onErrorContainer;
        label = 'Hết hạn';
        break;
      default:
        bg = scheme.surfaceContainerHighest;
        fg = scheme.onSurfaceVariant;
        label = status ?? 'Hoàn thành';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '';
    try {
      final dt = DateTime.parse(raw);
      return DateFormat('HH:mm dd/MM/yyyy').format(dt.toLocal());
    } catch (_) {
      return raw;
    }
  }
}
