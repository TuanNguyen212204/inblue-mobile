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

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(
                  alpha: isDark ? 0.88 : 0.96,
                ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(
                color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.08),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 36,
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
                  padding: const EdgeInsets.all(AppSpacing.md),
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
                        label: 'AI đang xử lý câu trả lời vừa gửi',
                      ),
                    if (room.phase == AiRoomPhase.evaluating)
                      const AiTypingIndicator(
                        label: 'AI đang đánh giá phản hồi của bạn',
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
                        'Đang chờ AI...',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.12),
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
                          color: room.isListening
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: answerCtrl,
                          enabled: !disabled,
                          maxLines: 3,
                          minLines: 1,
                          decoration: const InputDecoration(
                            hintText: 'Nhập câu trả lời...',
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
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
