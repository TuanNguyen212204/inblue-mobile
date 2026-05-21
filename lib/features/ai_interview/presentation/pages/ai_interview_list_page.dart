import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_list_notifier.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_empty_state.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

class AiInterviewListPage extends ConsumerStatefulWidget {
  const AiInterviewListPage({super.key});

  @override
  ConsumerState<AiInterviewListPage> createState() =>
      _AiInterviewListPageState();
}

class _AiInterviewListPageState extends ConsumerState<AiInterviewListPage> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listAsync = ref.watch(aiInterviewListNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Phỏng vấn AI'),
            actions: [
              IconButton(
                onPressed: () => context.push(RoutePaths.aiInterviewSetup),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: AppPrimaryButton(
                label: 'Tạo buổi mới',
                icon: Icons.auto_awesome,
                onPressed: () => context.push(RoutePaths.aiInterviewSetup),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
          listAsync.when(
            loading: () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) => const Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: AppShimmerCard(height: 120),
                ),
                childCount: 4,
              ),
            ),
            error: (e, _) => SliverFillRemaining(
              child: AppErrorView(
                message: e.toString(),
                onRetry: () =>
                    ref.read(aiInterviewListNotifierProvider.notifier).refresh(),
              ),
            ),
            data: (state) {
              _searchCtrl.text = state.search;
              return SliverList(
                delegate: SliverChildListDelegate([
                  if (state.active != null) ...[
                    _ActiveSessionCard(
                      session: state.active!,
                      onContinue: () {
                        context.push(
                          RoutePaths.aiInterviewSessionPath(
                            state.active!.sessionKey!,
                          ),
                        );
                      },
                    ).animate().fadeIn().slideY(begin: 0.05),
                    const SizedBox(height: AppSpacing.md),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                    ),
                    child: TextField(
                      controller: _searchCtrl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Tìm theo mode, domain...',
                      ),
                      onChanged: ref
                          .read(aiInterviewListNotifierProvider.notifier)
                          .setSearch,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  if (state.history.isEmpty)
                    const AppEmptyState(
                      title: 'Chưa có buổi phỏng vấn nào',
                      subtitle: 'Bắt đầu buổi phỏng vấn AI đầu tiên của bạn',
                      icon: Icons.psychology_outlined,
                    )
                  else
                    ...state.history.asMap().entries.map((entry) {
                      final s = entry.value;
                      return _HistoryCard(
                        session: s,
                        onTap: () {
                          if (s.isCompleted && s.id != null) {
                            context.push(
                              RoutePaths.aiInterviewResultPath(s.id!),
                            );
                          }
                        },
                      )
                          .animate(delay: (entry.key * 50).ms)
                          .fadeIn()
                          .slideY(begin: 0.04);
                    }),
                  const SizedBox(height: AppSpacing.xl),
                ]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActiveSessionCard extends StatelessWidget {
  const _ActiveSessionCard({
    required this.session,
    required this.onContinue,
  });

  final InterviewSession session;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.bolt,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Phiên đang diễn ra',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text('Mode: ${session.mode ?? '—'} · ${session.domain ?? ''}'),
            const SizedBox(height: AppSpacing.md),
            AppPrimaryButton(label: 'Tiếp tục', onPressed: onContinue),
          ],
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.session, required this.onTap});

  final InterviewSession session;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        0,
      ),
      child: ListTile(
        onTap: session.isCompleted ? onTap : null,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            session.isCompleted ? Icons.check_circle : Icons.schedule,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(session.mode ?? 'AI Interview'),
        subtitle: Text(
          '${session.status ?? ''} · ${session.createdAt?.substring(0, 10) ?? ''}',
        ),
        trailing: session.overallScore != null
            ? Chip(label: Text('${session.overallScore!.round()} đ'))
            : null,
      ),
    );
  }
}
