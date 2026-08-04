import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/core/extensions/exception_x.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_interview_providers.dart';

class WriteMentorFeedbackPage extends ConsumerStatefulWidget {
  const WriteMentorFeedbackPage({required this.sessionId, super.key});

  final int sessionId;

  @override
  ConsumerState<WriteMentorFeedbackPage> createState() =>
      _WriteMentorFeedbackPageState();
}

class _WriteMentorFeedbackPageState
    extends ConsumerState<WriteMentorFeedbackPage> {
  int _rating = 0;
  // STAR structured feedback controllers
  final _situationCtrl = TextEditingController();
  final _taskCtrl = TextEditingController();
  final _actionCtrl = TextEditingController();
  final _resultCtrl = TextEditingController();
  final _overallCtrl = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _situationCtrl.dispose();
    _taskCtrl.dispose();
    _actionCtrl.dispose();
    _resultCtrl.dispose();
    _overallCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Viết phản hồi Mentor')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // ── Star rating ──────────────────────────────────────────────────
          AppGlassSurface(
            child: Column(
              children: [
                Text(
                  'Đánh giá tổng thể',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) {
                    final star = i + 1;
                    return GestureDetector(
                      onTap: () => setState(() => _rating = star),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          star <= _rating ? Icons.star_rounded : Icons.star_border_rounded,
                          color: Colors.amber.shade600,
                          size: 42,
                        ).animate(target: star <= _rating ? 1 : 0).scale(
                              begin: const Offset(0.85, 0.85),
                              end: const Offset(1.1, 1.1),
                              duration: 150.ms,
                            ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _rating == 0
                      ? 'Chạm vào sao để đánh giá'
                      : _ratingLabel(_rating),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _rating > 0
                            ? Colors.amber.shade700
                            : scheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 50.ms),

          const SizedBox(height: AppSpacing.lg),

          // ── STAR framework header ─────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [scheme.primary, scheme.secondary],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Phương pháp STAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Phản hồi có cấu trúc giúp mentor cải thiện hiệu quả hơn',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 100.ms),

          const SizedBox(height: AppSpacing.md),

          // ── S — Situation ─────────────────────────────────────────────────
          _StarSection(
            letter: 'S',
            title: 'Situation – Bối cảnh',
            subtitle: 'Buổi phỏng vấn diễn ra như thế nào?',
            color: Colors.blue,
            controller: _situationCtrl,
            hint: 'Ví dụ: Mentor bắt đầu đúng giờ, phong thái thoải mái...',
            delay: 150,
          ),
          const SizedBox(height: AppSpacing.sm),

          // ── T — Task ──────────────────────────────────────────────────────
          _StarSection(
            letter: 'T',
            title: 'Task – Mục tiêu',
            subtitle: 'Mentor đã giúp bạn đạt mục tiêu gì?',
            color: Colors.green,
            controller: _taskCtrl,
            hint: 'Ví dụ: Rèn luyện kỹ năng trả lời về kinh nghiệm...',
            delay: 200,
          ),
          const SizedBox(height: AppSpacing.sm),

          // ── A — Action ────────────────────────────────────────────────────
          _StarSection(
            letter: 'A',
            title: 'Action – Hành động',
            subtitle: 'Mentor đã làm gì cụ thể trong buổi?',
            color: Colors.orange,
            controller: _actionCtrl,
            hint: 'Ví dụ: Mentor đặt câu hỏi sâu, đưa phản hồi chi tiết...',
            delay: 250,
          ),
          const SizedBox(height: AppSpacing.sm),

          // ── R — Result ────────────────────────────────────────────────────
          _StarSection(
            letter: 'R',
            title: 'Result – Kết quả',
            subtitle: 'Bạn cảm thấy tiến bộ như thế nào?',
            color: Colors.purple,
            controller: _resultCtrl,
            hint: 'Ví dụ: Tôi tự tin hơn sau buổi, biết cách cải thiện...',
            delay: 300,
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Overall comment ───────────────────────────────────────────────
          AppGlassSurface(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhận xét tổng quan',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _overallCtrl,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Chia sẻ thêm bất kỳ điều gì...',
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 350.ms),

          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: 'Gửi phản hồi',
            icon: Icons.send_rounded,
            isLoading: _submitting,
            onPressed: _submitting ? null : _submit,
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  String _ratingLabel(int r) => switch (r) {
        1 => 'Cần cải thiện nhiều ⭐',
        2 => 'Dưới mức kỳ vọng ⭐⭐',
        3 => 'Đạt yêu cầu ⭐⭐⭐',
        4 => 'Tốt ⭐⭐⭐⭐',
        5 => 'Xuất sắc ⭐⭐⭐⭐⭐',
        _ => '',
      };

  Future<void> _submit() async {
    if (_rating <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn số sao đánh giá')),
      );
      return;
    }

    final hasAnyContent = _situationCtrl.text.trim().isNotEmpty ||
        _taskCtrl.text.trim().isNotEmpty ||
        _actionCtrl.text.trim().isNotEmpty ||
        _resultCtrl.text.trim().isNotEmpty ||
        _overallCtrl.text.trim().isNotEmpty;

    if (!hasAnyContent) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập ít nhất một nhận xét')),
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
        // Structured STAR fields — sent as separate API properties
        'situation': _situationCtrl.text.trim(),
        'task': _taskCtrl.text.trim(),
        'action': _actionCtrl.text.trim(),
        'result': _resultCtrl.text.trim(),
        'overallComment': _overallCtrl.text.trim(),
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
          SnackBar(content: Text(e.toUserMessage())),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}

class _StarSection extends StatelessWidget {
  const _StarSection({
    required this.letter,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.controller,
    required this.hint,
    required this.delay,
  });

  final String letter;
  final String title;
  final String subtitle;
  final Color color;
  final TextEditingController controller;
  final String hint;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return AppGlassSurface(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: color.withValues(alpha: 0.15),
                child: Text(
                  letter,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.04);
  }
}
