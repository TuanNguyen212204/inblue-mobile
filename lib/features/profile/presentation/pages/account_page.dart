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
import 'package:inblue_mobile/features/profile/presentation/widgets/jd_purchases_tab.dart';
import 'package:inblue_mobile/features/profile/presentation/widgets/personal_info_tab.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

/// Full account hub — parity guide Part G (User/Candidate).
class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Phase 4: 4 web-parity tabs for Candidate role.
  // Wallet and Membership tabs are hidden (Decision 3).
  static const _tabs = [
    Tab(text: 'Hồ sơ UV'),
    Tab(text: 'Lịch sử mua JD'),
    Tab(text: 'Cá nhân'),
    Tab(text: 'Cài đặt'),
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

  Future<void> _refresh() async {
    await ref.read(accountNotifierProvider.notifier).refresh();
    if (!mounted) return;
    await ref.read(authNotifierProvider.notifier).refreshUserProfile();
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
                  subtitle: 'Hồ sơ · Lịch sử · Cài đặt',
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
                    onPreviewCv: bundle.user.cvUrl != null && bundle.user.cvUrl!.isNotEmpty
                        ? () async {
                            final uri = Uri.tryParse(bundle.user.cvUrl!);
                            if (uri == null || !await canLaunchUrl(uri)) {
                              if (!mounted) return;
                              ProfileUiUtils.showToast(
                                context,
                                'Không mở được CV',
                                isError: true,
                              );
                              return;
                            }
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          }
                        : null,
                    onRemoveAvatar: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Xóa ảnh đại diện'),
                          content: const Text(
                            'Bạn có chắc muốn xóa ảnh đại diện hiện tại?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, false),
                              child: const Text('Hủy'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(ctx, true),
                              child: const Text('Xóa'),
                            ),
                          ],
                        ),
                      );
                      if (confirmed != true) return;
                      try {
                        final updated = await ref
                            .read(accountNotifierProvider.notifier)
                            .removeAvatar(user: bundle.user);
                        if (!mounted) return;
                        await _refresh();
                        if (updated.avatarUrl == null || updated.avatarUrl!.isEmpty) {
                          ProfileUiUtils.showToast(context, 'Đã xóa ảnh đại diện');
                        } else {
                          ProfileUiUtils.showToast(
                            context,
                            'Xóa ảnh đại diện thất bại',
                            isError: true,
                          );
                        }
                      } catch (e) {
                        if (!mounted) return;
                        ProfileUiUtils.showToast(
                          context,
                          ProfileUiUtils.stripExceptionPrefix(e),
                          isError: true,
                        );
                      }
                    },
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
                // Tab 0: Hồ sơ Ứng viên
                RefreshIndicator(
                  onRefresh: () => _refresh(),
                  child: CandidateProfileTab(profile: bundle.candidate),
                ),
                // Tab 1: Lịch sử mua JD
                JdPurchasesTab(purchases: bundle.jdPurchases),
                // Tab 2: Cá nhân
                RefreshIndicator(
                  onRefresh: () => _refresh(),
                  child: PersonalInfoTab(user: bundle.user),
                ),
                // Tab 3: Cài đặt
                _SettingsTab(onRefresh: _refresh),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Settings tab — quick actions for candidate: Đăng xuất, Đổi mật khẩu, etc.
class _SettingsTab extends ConsumerWidget {
  const _SettingsTab({required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const SizedBox(height: AppSpacing.sm),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text('Đổi mật khẩu'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => showAccountSettingsSheet(context, ref),
              ),
              const Divider(height: 1, indent: 56),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Thông báo'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {},
              ),
              const Divider(height: 1, indent: 56),
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: const Text('Ngôn ngữ'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: ListTile(
            leading: Icon(Icons.logout_rounded,
                color: Theme.of(context).colorScheme.error),
            title: Text(
              'Đăng xuất',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Xác nhận đăng xuất'),
                  content: const Text('Bạn có muốn đăng xuất khỏi tài khoản?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Hủy')),
                    FilledButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Đăng xuất')),
                  ],
                ),
              );
              if (ok == true && context.mounted) {
                ref.read(authNotifierProvider.notifier).logout();
              }
            },
          ),
        ),
      ],
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
