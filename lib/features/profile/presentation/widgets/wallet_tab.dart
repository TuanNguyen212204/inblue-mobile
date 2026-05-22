import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';

class WalletTab extends ConsumerWidget {
  const WalletTab({required this.user, super.key});

  final UserAccount user;

  static const _presetAmounts = [
    10000,
    50000,
    100000,
    200000,
    500000,
    1000000,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      children: [
        _WalletBalanceCard(balance: user.walletBalance)
            .animate()
            .fadeIn()
            .slideY(begin: 0.05),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Nạp tiền nhanh qua PayOS',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Chọn mức nạp từ 10.000₫ đến 20.000.000₫',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: _presetAmounts
              .map(
                (a) => ActionChip(
                  label: Text(ProfileUiUtils.formatVnd(a)),
                  onPressed: () => _topUp(context, ref, a),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: AppSpacing.md),
        AppPrimaryButton(
          label: 'Nạp số tiền khác',
          onPressed: () => _showCustomTopUp(context, ref),
        ),
      ],
    );
  }

  Future<void> _topUp(BuildContext context, WidgetRef ref, int amount) async {
    try {
      final url = await ref.read(accountNotifierProvider.notifier).topUp(amount);
      final ok = await ProfileUiUtils.launchPaymentUrl(url);
      if (context.mounted) {
        if (ok) {
          ProfileUiUtils.showToast(
            context,
            'Đã mở trang thanh toán. Sau khi hoàn tất, kéo xuống để làm mới số dư.',
          );
        } else {
          ProfileUiUtils.showToast(
            context,
            'Không mở được liên kết thanh toán',
            isError: true,
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ProfileUiUtils.showToast(
          context,
          ProfileUiUtils.stripExceptionPrefix(e),
          isError: true,
        );
      }
    }
  }

  Future<void> _showCustomTopUp(BuildContext context, WidgetRef ref) async {
    final ctrl = TextEditingController();
    final amount = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nạp tiền'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Số tiền (VND)',
            hintText: 'VD: 500000',
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          FilledButton(
            onPressed: () {
              final v = int.tryParse(ctrl.text.replaceAll(RegExp(r'[^\d]'), ''));
              if (v == null || v < 10000 || v > 20000000) {
                ProfileUiUtils.showToast(
                  ctx,
                  'Số tiền từ 10.000 đến 20.000.000 VND',
                  isError: true,
                );
                return;
              }
              Navigator.pop(ctx, v);
            },
            child: const Text('Tiếp tục'),
          ),
        ],
      ),
    );
    ctrl.dispose();
    if (amount != null && context.mounted) {
      await _topUp(context, ref, amount);
    }
  }
}

class _WalletBalanceCard extends StatelessWidget {
  const _WalletBalanceCard({required this.balance});

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0047AB), Color(0xFF007BFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0047AB).withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Số dư ví',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            ProfileUiUtils.formatVnd(balance),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
