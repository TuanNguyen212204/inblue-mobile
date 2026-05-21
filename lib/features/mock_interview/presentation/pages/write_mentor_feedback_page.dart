import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_interview_providers.dart';

class WriteMentorFeedbackPage extends ConsumerStatefulWidget {
  const WriteMentorFeedbackPage({required this.sessionId, super.key});

  final int sessionId;

  @override
  ConsumerState<WriteMentorFeedbackPage> createState() =>
      _WriteMentorFeedbackPageState();
}

class _WriteMentorFeedbackPageState extends ConsumerState<WriteMentorFeedbackPage> {
  int _rating = 0;
  final _commentCtrl = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Viết phản hồi')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Đánh giá Mentor', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                final star = i + 1;
                return IconButton(
                  onPressed: () => setState(() => _rating = star),
                  icon: Icon(
                    star <= _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 36,
                  ),
                );
              }),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _commentCtrl,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Nhận xét',
                hintText: 'Chia sẻ trải nghiệm với mentor...',
              ),
            ),
            const Spacer(),
            AppPrimaryButton(
              label: 'Gửi phản hồi',
              isLoading: _submitting,
              onPressed: _submitting ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_rating <= 0 && _commentCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nhập rating hoặc nhận xét')),
      );
      return;
    }
    final userId = ref.read(currentUserIdProvider);
    final session =
        await ref.read(mockInterviewRemoteProvider).getSession(widget.sessionId);
    if (userId == null) return;

    setState(() => _submitting = true);
    try {
      await ref.read(mockInterviewRemoteProvider).createMentorFeedback({
        'sessionId': widget.sessionId,
        'mentorId': session.userId2,
        'userId': userId,
        'rating': _rating,
        'comment': _commentCtrl.text.trim(),
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gửi phản hồi thành công')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}
