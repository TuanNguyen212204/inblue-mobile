import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/kiosk/kiosk_mode_service.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_room_notifier.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/services/interview_speech_service.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_chat_bubble.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_typing_indicator.dart';

class AiInterviewRoomPage extends ConsumerStatefulWidget {
  const AiInterviewRoomPage({required this.sessionKey, super.key});

  final String sessionKey;

  @override
  ConsumerState<AiInterviewRoomPage> createState() =>
      _AiInterviewRoomPageState();
}

class _AiInterviewRoomPageState extends ConsumerState<AiInterviewRoomPage> {
  final _speech = InterviewSpeechService();
  final _answerCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    KioskModeService.enter();
    _speech.init();
  }

  @override
  void dispose() {
    KioskModeService.exit();
    _answerCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final room = ref.watch(aiInterviewRoomProvider(widget.sessionKey));

    ref.listen(aiInterviewRoomProvider(widget.sessionKey), (_, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollCtrl.hasClients) {
          _scrollCtrl.animateTo(
            _scrollCtrl.position.maxScrollExtent,
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOut,
          );
        }
      });
      final lastAi = next.messages.where((m) => !m.isUser).lastOrNull;
      if (lastAi != null && next.phase == AiRoomPhase.interviewing) {
        _speech.speak(lastAi.text);
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmExit(context);
      },
      child: Scaffold(
        appBar: room.phase == AiRoomPhase.deviceCheck
            ? AppBar(title: const Text('Kiểm tra thiết bị'))
            : AppBar(
                title: Text(room.phaseName ?? 'Phỏng vấn AI'),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => _confirmExit(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(4),
                  child: LinearProgressIndicator(value: room.progress),
                ),
              ),
        body: switch (room.phase) {
          AiRoomPhase.deviceCheck => _DeviceCheck(
              onConfirm: () => ref
                  .read(aiInterviewRoomProvider(widget.sessionKey).notifier)
                  .confirmDeviceCheck(),
            ),
          AiRoomPhase.loading || AiRoomPhase.starting => const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Đang khởi tạo phòng phỏng vấn...'),
                ],
              ),
            ),
          AiRoomPhase.expired || AiRoomPhase.error => _EndState(
              message: room.errorMessage ?? 'Phiên không khả dụng',
              actionLabel: 'Tạo buổi mới',
              onAction: () => context.go(RoutePaths.aiInterviewSetup),
            ),
          AiRoomPhase.finished => _EndState(
              message: 'Phỏng vấn hoàn tất!',
              actionLabel: 'Xem kết quả chi tiết',
              onAction: () {
                final id = room.dbId;
                if (id != null) {
                  context.go(RoutePaths.aiInterviewResultPath(id));
                }
              },
            ),
          _ => _RoomBody(
              room: room,
              answerCtrl: _answerCtrl,
              scrollCtrl: _scrollCtrl,
              speech: _speech,
              sessionKey: widget.sessionKey,
            ),
        },
      ),
    );
  }

  Future<void> _confirmExit(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Kết thúc phỏng vấn?'),
        content: const Text('Tiến trình hiện tại sẽ được lưu nếu còn trong thời hạn 1 giờ.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Ở lại')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Thoát')),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      await KioskModeService.exit();
      context.go(RoutePaths.aiInterviewList);
    }
  }
}

class _RoomBody extends ConsumerWidget {
  const _RoomBody({
    required this.room,
    required this.answerCtrl,
    required this.scrollCtrl,
    required this.speech,
    required this.sessionKey,
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

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: _AiStage(
            room: room,
            onReplay: (text) => speech.speak(text),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
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
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock_outline, size: 16),
                        SizedBox(width: 6),
                        Text('Đang chờ AI...'),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
                          room.isListening ? Icons.stop_circle : Icons.mic,
                          color: room.isListening ? Colors.red : null,
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
                          ),
                          onChanged: notifier.setDraft,
                        ),
                      ),
                      IconButton(
                        onPressed: disabled
                            ? null
                            : () => notifier.submitAnswer(),
                        icon: const Icon(Icons.send_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AiStage extends StatelessWidget {
  const _AiStage({required this.room, required this.onReplay});

  final AiRoomState room;
  final void Function(String text) onReplay;

  @override
  Widget build(BuildContext context) {
    final thinking = room.phase == AiRoomPhase.submitting ||
        room.phase == AiRoomPhase.evaluating;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.85),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.35),
            blurRadius: thinking ? 24 : 12,
            spreadRadius: thinking ? 4 : 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.smart_toy, size: 72, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            thinking ? 'AI đang suy nghĩ...' : 'Trợ lý phỏng vấn AI',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (room.isListening) ...[
            const SizedBox(height: 8),
            const Text(
              'Đang thu âm câu trả lời của bạn',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ],
      ),
    );
  }
}

class _DeviceCheck extends StatelessWidget {
  const _DeviceCheck({required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.headset_mic, size: 64),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Kiểm tra micro, loa và camera trước khi bắt đầu',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(label: 'Sẵn sàng — Bắt đầu', onPressed: onConfirm),
        ],
      ),
    );
  }
}

class _EndState extends StatelessWidget {
  const _EndState({
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(label: actionLabel, onPressed: onAction),
          ],
        ),
      ),
    );
  }
}
