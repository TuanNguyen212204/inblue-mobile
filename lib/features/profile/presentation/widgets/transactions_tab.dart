import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/domain/entities/wallet_transaction.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_empty_state.dart';
import 'package:intl/intl.dart';

class TransactionsTab extends ConsumerWidget {
  const TransactionsTab({required this.transactions, super.key});

  final List<WalletTransaction> transactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (transactions.isEmpty) {
      return AppEmptyState(
        title: 'Chưa có giao dịch',
        subtitle: 'Lịch sử nạp tiền và thanh toán sẽ hiển thị tại đây',
        icon: Icons.receipt_long_outlined,
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
        itemCount: transactions.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return _TransactionTile(tx: tx)
              .animate()
              .fadeIn(delay: (index * 40).ms)
              .slideX(begin: 0.02);
        },
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.tx});

  final WalletTransaction tx;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final incoming = tx.isIncoming;
    final color = incoming ? Colors.green.shade600 : scheme.error;
    final sign = incoming ? '+' : '-';
    final date = _formatDate(tx.createdAt);

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(
              incoming ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
              color: color,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.description?.trim().isNotEmpty == true
                      ? tx.description!
                      : (tx.paymentPurpose ?? 'Giao dịch'),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                if (date.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(date, style: Theme.of(context).textTheme.bodySmall),
                ],
                if (tx.transactionCode != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    tx.transactionCode!,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ],
            ),
          ),
          Text(
            '$sign${ProfileUiUtils.formatVnd(tx.amount.abs())}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '';
    try {
      final dt = DateTime.parse(raw);
      return DateFormat('dd/MM/yyyy HH:mm').format(dt.toLocal());
    } catch (_) {
      return raw;
    }
  }
}
