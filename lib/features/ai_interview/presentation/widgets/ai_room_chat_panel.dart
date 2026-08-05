import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_room_notifier.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/services/interview_speech_service.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_chat_bubble.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_typing_indicator.dart';

class AiRoomChatPanel extends ConsumerWidget {
  const AiRoomChatPanel({
    required this.room,
    required this.answerCtrl,
    required this.scrollCtrl,
    required this.speech,
    required this.sessionKey,
    super.key,
  });

  final AiRoomState room;
  final TextEditingController answerCtrl;
  final ScrollController scrollCtrl;
  final InterviewSpeechService speech;
  final String sessionKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(aiInterviewRoomProvider(sessionKey).notifier);
    final disabled = room.phase == AiRoomPhase.submitting ||
        room.phase == AiRoomPhase.evaluating;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(
                  alpha: isDark ? 0.9 : 0.97,
                ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(
                color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.08),
                blurRadius: 20,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 38,
                height: 4,
                margin: const EdgeInsets.only(top: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollCtrl,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  children: [
                    ...room.messages.map(
                      (m) => AiChatBubble(
                        text: m.text,
                        isUser: m.isUser,
                        onReplayTts:
                            m.isUser ? null : () => speech.speak(m.text),
                      ),
                    ),
                    if (room.phase == AiRoomPhase.submitting)
                      const AiTypingIndicator(
                        label: 'AI đang phân tích câu trả lời...',
                      ),
                    if (room.phase == AiRoomPhase.evaluating)
                      const AiTypingIndicator(
                        label: 'AI đang tổng hợp đánh giá...',
                      ),
                  ],
                ),
              ),
              if (disabled)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.hourglass_top_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Đang chờ AI phản hồi...',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 12 + bottomInset),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: disabled
                            ? null
                            : () async {
                                if (room.isListening) {
                                  await speech.stopListening();
                                  notifier.setListening(false);
                                  notifier.submitAnswer(answerCtrl.text);
                                } else {
                                  notifier.setListening(true);
                                  await speech.listen(
                                    onResult: (text) {
                                      answerCtrl.text = text;
                                      notifier.setDraft(text);
                                    },
                                  );
                                }
                              },
                        icon: Icon(
                          room.isListening
                              ? Icons.stop_circle_rounded
                              : Icons.mic_rounded,
                          size: 24,
                          color: room.isListening
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                        ),
                        tooltip: room.isListening ? 'Dừng & Gửi' : 'Ghi âm trả lời',
                      ),
                      Expanded(
                        child: TextField(
                          controller: answerCtrl,
                          enabled: !disabled,
                          maxLines: 3,
                          minLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            hintText: 'Nhập câu trả lời của bạn...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onChanged: notifier.setDraft,
                        ),
                      ),
                      IconButton(
                        onPressed: disabled ? null : () => notifier.submitAnswer(),
                        icon: Icon(
                          Icons.send_rounded,
                          size: 22,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        tooltip: 'Gửi câu trả lời',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
