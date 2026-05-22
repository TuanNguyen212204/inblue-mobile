import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/domain/entities/membership_plan.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';

class MembershipTab extends ConsumerWidget {
  const MembershipTab({
    required this.user,
    required this.plans,
    required this.subscription,
    super.key,
  });

  final UserAccount user;
  final List<MembershipPlan> plans;
  final UserSubscription subscription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final planName = subscription.planName ?? user.membershipPlanName ?? 'FREE';

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      children: [
        AppGlassSurface(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gói hiện tại',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                planName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              if (subscription.expiredAt != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Hết hạn: ${subscription.expiredAt}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
              const SizedBox(height: AppSpacing.md),
              _QuotaRow(
                icon: Icons.smart_toy_outlined,
                label: 'AI Interview còn lại',
                value: '${subscription.aiInterviewRemaining}',
              ),
              _QuotaRow(
                icon: Icons.fitness_center_outlined,
                label: 'Practice sets',
                value: '${subscription.practiceSetRemaining}',
              ),
              _QuotaRow(
                icon: Icons.quiz_outlined,
                label: 'Quiz sets',
                value: '${subscription.quizSetRemaining}',
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Nâng cấp gói',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...plans.asMap().entries.map((entry) {
          final plan = entry.value;
          final isCurrent = plan.name == planName.toUpperCase();
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _PlanCard(
              plan: plan,
              isCurrent: isCurrent,
              walletBalance: user.walletBalance,
              onPayWallet: () => _payWithWallet(context, ref, plan),
              onPayPayOs: () => _payWithPayOs(context, ref, plan),
            )
                .animate()
                .fadeIn(delay: (entry.key * 60).ms)
                .slideY(begin: 0.04),
          );
        }),
      ],
    );
  }

  Future<void> _payWithWallet(
    BuildContext context,
    WidgetRef ref,
    MembershipPlan plan,
  ) async {
    if (plan.price <= 0) {
      ProfileUiUtils.showToast(context, 'Gói miễn phí không cần thanh toán');
      return;
    }
    if (user.walletBalance < plan.price) {
      ProfileUiUtils.showToast(
        context,
        'Số dư không đủ. Vui lòng nạp thêm tiền.',
        isError: true,
      );
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Mua gói ${plan.name}'),
        content: Text(
          'Thanh toán ${ProfileUiUtils.formatVnd(plan.price)} từ ví?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xác nhận')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    try {
      await ref.read(accountNotifierProvider.notifier).payMembershipWallet(
            amount: plan.price.round(),
            planId: plan.id,
          );
      if (context.mounted) {
        ProfileUiUtils.showToast(context, 'Đã đăng ký gói ${plan.name} thành công');
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

  Future<void> _payWithPayOs(
    BuildContext context,
    WidgetRef ref,
    MembershipPlan plan,
  ) async {
    if (plan.price <= 0) return;
    try {
      final url = await ref.read(accountNotifierProvider.notifier).payMembershipPayOs(
            plan.price.round(),
          );
      final launched = await ProfileUiUtils.launchPaymentUrl(url);
      if (context.mounted) {
        ProfileUiUtils.showToast(
          context,
          launched
              ? 'Đã mở PayOS. Sau thanh toán, kéo xuống để làm mới.'
              : 'Không mở được liên kết thanh toán',
          isError: !launched,
        );
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
}

class _QuotaRow extends StatelessWidget {
  const _QuotaRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(label)),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.plan,
    required this.isCurrent,
    required this.walletBalance,
    required this.onPayWallet,
    required this.onPayPayOs,
  });

  final MembershipPlan plan;
  final bool isCurrent;
  final double walletBalance;
  final VoidCallback onPayWallet;
  final VoidCallback onPayPayOs;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final canAfford = walletBalance >= plan.price;

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  plan.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              if (isCurrent)
                Chip(
                  label: const Text('Đang dùng'),
                  backgroundColor: scheme.primaryContainer,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            plan.price > 0
                ? ProfileUiUtils.formatVnd(plan.price)
                : 'Miễn phí',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: scheme.primary,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text('AI: ${plan.maxAiInterview} · Practice: ${plan.maxPracticeSets} · Quiz: ${plan.maxQuizSets}'),
          Text('Thời hạn: ${plan.durationDays} ngày', style: Theme.of(context).textTheme.bodySmall),
          if (!isCurrent && plan.price > 0) ...[
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: canAfford ? onPayWallet : null,
                    child: const Text('Ví'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: FilledButton(
                    onPressed: onPayPayOs,
                    child: const Text('PayOS'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
