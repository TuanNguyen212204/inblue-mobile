import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/practice_set.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_providers.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/select_roadmap_dialog.dart';
import 'package:inblue_mobile/core/extensions/exception_x.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

final aiInterviewResultProvider = FutureProvider.autoDispose
    .family<InterviewSession, int>((ref, sessionId) async {
  return ref.read(aiInterviewRemoteProvider).getSessionById(sessionId);
});

final practiceSetsByInterviewProvider = FutureProvider.autoDispose
    .family<List<PracticeSet>, int>((ref, sessionId) async {
  final raw =
      await ref.read(aiInterviewRemoteProvider).getPracticeSetsByInterview(sessionId);
  return raw.map((e) => PracticeSet.fromJson(e)).toList();
});

class AiInterviewResultPage extends ConsumerStatefulWidget {
  const AiInterviewResultPage({required this.sessionId, super.key});

  final int sessionId;

  @override
  ConsumerState<AiInterviewResultPage> createState() =>
      _AiInterviewResultPageState();
}

class _AiInterviewResultPageState extends ConsumerState<AiInterviewResultPage> {
  bool _creatingRoadmap = false;

  Future<void> _createRoadmap(int dateNumber) async {
    setState(() => _creatingRoadmap = true);
    try {
      await ref.read(aiInterviewRemoteProvider).createPracticeSetByAi(
            aiInterviewId: widget.sessionId,
            dateNumber: dateNumber,
          );
      ref.invalidate(practiceSetsByInterviewProvider(widget.sessionId));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã tạo lộ trình luyện tập thành công!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toUserMessage())),
        );
      }
    } finally {
      if (mounted) setState(() => _creatingRoadmap = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(aiInterviewResultProvider(widget.sessionId));
    final practiceSets =
        ref.watch(practiceSetsByInterviewProvider(widget.sessionId));

    return Scaffold(
      appBar: AppBar(title: const Text('Kết quả phỏng vấn')),
      body: result.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: AppShimmerCard(height: 200),
        ),
        error: (e, _) => AppErrorView(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(aiInterviewResultProvider(widget.sessionId)),
        ),
        data: (session) {
          final sets = practiceSets.valueOrNull ?? [];
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              _ScoreHeader(session: session).animate().fadeIn().scale(
                    begin: const Offset(0.95, 0.95),
                  ),
              const SizedBox(height: AppSpacing.lg),
              if (session.resultDetail?.aiOverviewFeedback != null)
                _Section(
                  title: 'Tổng quan',
                  child: Text(session.resultDetail!.aiOverviewFeedback!),
                ),
              _ImprovementSection(
                session: session,
                practiceSets: sets,
                practiceLoading: practiceSets.isLoading,
                onCreateRoadmap: () async {
                  final days = await SelectRoadmapDialog.show(
                    context,
                    isLoading: _creatingRoadmap,
                  );
                  if (days != null) await _createRoadmap(days);
                },
                isCreating: _creatingRoadmap,
              ),
              if (session.resultDetail?.history != null) ...[
                Text(
                  'Chi tiết Q&A',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                ...session.resultDetail!.history!.map(
                  (qa) => Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: ExpansionTile(
                      title: Text(qa.questionText ?? 'Câu hỏi'),
                      subtitle: qa.score != null
                          ? Text('Điểm: ${qa.score!.toStringAsFixed(1)}')
                          : null,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (qa.answerText != null)
                                Text('Trả lời: ${qa.answerText}'),
                              if (qa.feedback != null) ...[
                                const SizedBox(height: 8),
                                Text('Nhận xét: ${qa.feedback}'),
                              ],
                              if (qa.suggestion != null && qa.suggestion!.isNotEmpty) ...[
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(AppSpacing.sm),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.amber.shade300),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.lightbulb_outline, size: 20, color: Colors.amber.shade900),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Gợi ý cải thiện:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber.shade900,
                                                fontSize: 13,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              qa.suggestion!,
                                              style: TextStyle(color: Colors.amber.shade900, fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              if (qa.behavioralWarnings != null && qa.behavioralWarnings!.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(AppSpacing.sm),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.red.shade300),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.warning_amber_rounded, size: 20, color: Colors.red.shade900),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cảnh báo hành vi:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red.shade900,
                                                fontSize: 13,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            ...qa.behavioralWarnings!.map(
                                              (w) => Text(
                                                '• $w',
                                                style: TextStyle(color: Colors.red.shade900, fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _ImprovementSection extends StatelessWidget {
  const _ImprovementSection({
    required this.session,
    required this.practiceSets,
    required this.practiceLoading,
    required this.onCreateRoadmap,
    required this.isCreating,
  });

  final InterviewSession session;
  final List<PracticeSet> practiceSets;
  final bool practiceLoading;
  final VoidCallback onCreateRoadmap;
  final bool isCreating;

  @override
  Widget build(BuildContext context) {
    final detail = session.resultDetail;
    final isCompleted = session.isCompleted;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Section(
          title: 'Kế hoạch cải thiện',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (detail?.improvementPlan != null)
                Text(detail!.improvementPlan!)
              else if (practiceSets.isEmpty)
                const Text(
                  'Chưa có kế hoạch',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              if (isCompleted && detail != null) ...[
                const SizedBox(height: AppSpacing.md),
                if (practiceLoading)
                  const Center(child: CircularProgressIndicator())
                else if (practiceSets.isNotEmpty) ...[
                  Text(
                    'Lộ trình đã tạo',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ...practiceSets.map(
                    (ps) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.route, size: 18),
                      ),
                      title: Text(ps.practiceSetName ?? 'Lộ trình luyện tập'),
                      subtitle: Text(ps.objective ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                      onTap: ps.id != null
                          ? () => context.push(
                                RoutePaths.practiceSetDetailPath(ps.id!),
                                extra: ps,
                              )
                          : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OutlinedButton.icon(
                    onPressed: isCreating ? null : onCreateRoadmap,
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('Tạo lộ trình luyện tập mới'),
                  ),
                ] else
                  AppPrimaryButton(
                    label: 'Tạo lộ trình luyện tập',
                    icon: Icons.auto_awesome,
                    isLoading: isCreating,
                    onPressed: isCreating ? null : onCreateRoadmap,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoreHeader extends StatelessWidget {
  const _ScoreHeader({required this.session});

  final InterviewSession session;

  Color _resultColor(BuildContext context) => switch (session.result) {
        'STRONG_HIRE' || 'HIRE' => Colors.green,
        'CONSIDER' => Colors.orange,
        _ => Theme.of(context).colorScheme.error,
      };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            Text(
              session.overallScore?.toStringAsFixed(1) ?? '—',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(session.result ?? 'Kết quả'),
              backgroundColor: _resultColor(context).withValues(alpha: 0.15),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: child,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
