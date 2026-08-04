import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_compact_header.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/components/app_status_badge.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/dashboard/presentation/widgets/shell_tab_body.dart';
import 'package:inblue_mobile/features/mock_interview/domain/entities/mock_session.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_interview_providers.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_empty_state.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

class MockInterviewListPage extends ConsumerStatefulWidget {
  const MockInterviewListPage({super.key});

  @override
  ConsumerState<MockInterviewListPage> createState() =>
      _MockInterviewListPageState();
}

class _MockInterviewListPageState extends ConsumerState<MockInterviewListPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessions = ref.watch(mockSessionListProvider);

    return ShellTabBody(
      child: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverToBoxAdapter(
            child: AppCompactHeader(
              title: 'Phỏng vấn Mock',
              subtitle: 'Lịch với mentor chuyên gia',
              actions: [
                IconButton(
                  onPressed: () => context.push(RoutePaths.mockInterviewSchedule),
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      decoration: InputDecoration(
                        hintText: 'Tìm buổi phỏng vấn...',
                        prefixIcon: const Icon(Icons.search_rounded),
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (v) => setState(() => _query = v.toLowerCase()),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  FilledButton.icon(
                    onPressed: () => context.push(RoutePaths.mockInterviewSchedule),
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Đặt lịch'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabCtrl,
              tabs: const [
                Tab(text: 'Sắp tới'),
                Tab(text: 'Đã hoàn thành'),
              ],
            ),
          ),
        ],
        body: sessions.when(
          loading: () => ListView.builder(
            itemCount: 4,
            itemBuilder: (_, __) => const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: AppShimmerCard(),
            ),
          ),
          error: (e, _) => AppErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(mockSessionListProvider),
          ),
          data: (list) {
            final filtered = _query.isEmpty
                ? list
                : list.where((s) {
                    final mentor = s.userId2?.toString() ?? '';
                    final status = s.status?.toLowerCase() ?? '';
                    return mentor.contains(_query) || status.contains(_query);
                  }).toList();

            final upcoming = filtered.where((s) {
              return s.status == 'SCHEDULED' ||
                  s.status == 'PAID' ||
                  s.status == 'ONGOING' ||
                  s.status == 'DRAFT';
            }).toList();

            final completed = filtered
                .where((s) => s.status == 'COMPLETED' || s.status == 'DONE')
                .toList();

            return TabBarView(
              controller: _tabCtrl,
              children: [
                _SessionList(
                  sessions: upcoming,
                  emptyTitle: 'Chưa có lịch sắp tới',
                  emptySubtitle: 'Đặt lịch với mentor để bắt đầu',
                ),
                _SessionList(
                  sessions: completed,
                  emptyTitle: 'Chưa có buổi hoàn thành',
                  emptySubtitle: 'Các buổi đã kết thúc sẽ hiển thị ở đây',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SessionList extends StatelessWidget {
  const _SessionList({
    required this.sessions,
    required this.emptyTitle,
    required this.emptySubtitle,
  });

  final List<MockSession> sessions;
  final String emptyTitle;
  final String emptySubtitle;

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) {
      return AppEmptyState(
        title: emptyTitle,
        subtitle: emptySubtitle,
        icon: Icons.people_outline,
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: ShellTabLayout.bottomInset),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        return _SessionCard(session: sessions[index])
            .animate(delay: (index * 40).ms)
            .fadeIn()
            .slideY(begin: 0.05);
      },
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.session});

  final MockSession session;

  @override
  Widget build(BuildContext context) {
    final canJoin = session.canJoin(DateTime.now());
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        0,
      ),
      child: AppGlassSurface(
        padding: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (session.id != null) {
              context.push(RoutePaths.mockInterviewHistoryPath(session.id!));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppStatusBadge(
                      label: session.status ?? '—',
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const Spacer(),
                    if (session.totalPrice != null)
                      Text('${session.totalPrice!.round()}đ'),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text('${session.joinTime ?? ''} · ${session.duration ?? 0} phút'),
                const SizedBox(height: AppSpacing.md),
                if (canJoin)
                  AppPrimaryButton(
                    label: 'Tham gia',
                    onPressed: () {
                      context.push(RoutePaths.mockInterviewRoomPath(session.id!));
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
