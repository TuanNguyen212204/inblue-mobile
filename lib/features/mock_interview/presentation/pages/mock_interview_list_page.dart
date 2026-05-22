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

class MockInterviewListPage extends ConsumerWidget {
  const MockInterviewListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(mockSessionListProvider);

    return ShellTabBody(
      child: RefreshIndicator(
        onRefresh: () async => ref.invalidate(mockSessionListProvider),
        child: CustomScrollView(
          slivers: [
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
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: AppPrimaryButton(
                  label: 'Đặt lịch với Mentor',
                  icon: Icons.event_available,
                  onPressed: () => context.push(RoutePaths.mockInterviewSchedule),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            sessions.when(
              loading: () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, __) => const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: AppShimmerCard(),
                  ),
                  childCount: 4,
                ),
              ),
              error: (e, _) => SliverFillRemaining(
                child: AppErrorView(
                  message: e.toString(),
                  onRetry: () => ref.invalidate(mockSessionListProvider),
                ),
              ),
              data: (list) {
                final upcoming = list.where((s) {
                  return s.status == 'SCHEDULED' ||
                      s.status == 'PAID' ||
                      s.status == 'ONGOING' ||
                      s.status == 'DRAFT';
                }).toList();

                if (upcoming.isEmpty) {
                  return const SliverFillRemaining(
                    child: AppEmptyState(
                      title: 'Chưa có lịch phỏng vấn Mock',
                      subtitle: 'Đặt lịch với mentor để bắt đầu',
                      icon: Icons.people_outline,
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final s = upcoming[index];
                      return _SessionCard(session: s)
                          .animate(delay: (index * 40).ms)
                          .fadeIn()
                          .slideY(begin: 0.05);
                    },
                    childCount: upcoming.length,
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: ShellTabLayout.bottomInset),
            ),
          ],
        ),
      ),
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
