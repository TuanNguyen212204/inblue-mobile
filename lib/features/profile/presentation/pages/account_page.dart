import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_compact_header.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/dashboard/presentation/widgets/shell_tab_body.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/account_settings_sheet.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/account_summary_card.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/candidate_profile_tab.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/membership_tab.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/personal_info_tab.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/transactions_tab.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/wallet_tab.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

/// Full account hub — parity guide Part G (User/Candidate).
class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _tabs = [
    Tab(text: 'Cá nhân'),
    Tab(text: 'Ví'),
    Tab(text: 'Lịch sử'),
    Tab(text: 'Hồ sơ UV'),
    Tab(text: 'Gói'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(authNotifierProvider.notifier).refreshUserProfile();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountAsync = ref.watch(accountNotifierProvider);

    return ShellTabBody(
      child: accountAsync.when(
        loading: () => const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppCompactHeader(
                title: 'Tài khoản',
                subtitle: 'Đang tải...',
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: AppShimmerCard(height: 200),
              ),
            ),
          ],
        ),
        error: (e, _) => CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppCompactHeader(
                title: 'Tài khoản',
                subtitle: 'Không tải được dữ liệu',
              ),
            ),
            SliverFillRemaining(
              child: AppErrorView(
                message: e.toString(),
                onRetry: () => ref.invalidate(accountNotifierProvider),
              ),
            ),
          ],
        ),
        data: (bundle) {
          final planLabel =
              bundle.subscription.planName ?? bundle.user.membershipPlanName ?? 'FREE';

          return NestedScrollView(
            headerSliverBuilder: (context, innerScrolled) => [
              SliverToBoxAdapter(
                child: AppCompactHeader(
                  title: 'Tài khoản',
                  subtitle: 'Hồ sơ · Ví · Gói thành viên',
                  actions: [
                    IconButton(
                      tooltip: 'Cài đặt',
                      icon: const Icon(Icons.settings_outlined),
                      onPressed: () => showAccountSettingsSheet(context, ref),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AccountSummaryCard(
                    user: bundle.user,
                    planLabel: planLabel,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: _tabs,
                  ),
                ),
              ),
            ],
            body: TabBarView(
              controller: _tabController,
              children: [
                RefreshIndicator(
                  onRefresh: () => ref.read(accountNotifierProvider.notifier).refresh(),
                  child: PersonalInfoTab(user: bundle.user),
                ),
                RefreshIndicator(
                  onRefresh: () => ref.read(accountNotifierProvider.notifier).refresh(),
                  child: WalletTab(user: bundle.user),
                ),
                TransactionsTab(transactions: bundle.transactions),
                RefreshIndicator(
                  onRefresh: () => ref.read(accountNotifierProvider.notifier).refresh(),
                  child: CandidateProfileTab(profile: bundle.candidate),
                ),
                RefreshIndicator(
                  onRefresh: () => ref.read(accountNotifierProvider.notifier).refresh(),
                  child: MembershipTab(
                    user: bundle.user,
                    plans: bundle.plans,
                    subscription: bundle.subscription,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar;
}
