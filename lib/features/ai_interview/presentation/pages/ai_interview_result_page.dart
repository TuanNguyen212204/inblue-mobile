import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_providers.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

final aiInterviewResultProvider = FutureProvider.autoDispose
    .family<InterviewSession, int>((ref, sessionId) async {
  return ref.read(aiInterviewRemoteProvider).getSessionById(sessionId);
});

class AiInterviewResultPage extends ConsumerWidget {
  const AiInterviewResultPage({required this.sessionId, super.key});

  final int sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(aiInterviewResultProvider(sessionId));

    return Scaffold(
      appBar: AppBar(title: const Text('Kết quả phỏng vấn')),
      body: result.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: AppShimmerCard(height: 200),
        ),
        error: (e, _) => AppErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(aiInterviewResultProvider(sessionId)),
        ),
        data: (session) => ListView(
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
            if (session.resultDetail?.improvementPlan != null)
              _Section(
                title: 'Lộ trình cải thiện',
                child: Text(session.resultDetail!.improvementPlan!),
              ),
            if (session.resultDetail?.history != null) ...[
              Text('Chi tiết Q&A', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              ...session.resultDetail!.history!.map(
                (qa) => Card(
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
                            if (qa.answerText != null) Text('Trả lời: ${qa.answerText}'),
                            if (qa.feedback != null) ...[
                              const SizedBox(height: 8),
                              Text('Nhận xét: ${qa.feedback}'),
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
        ),
      ),
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
        Card(child: Padding(padding: const EdgeInsets.all(AppSpacing.md), child: child)),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
