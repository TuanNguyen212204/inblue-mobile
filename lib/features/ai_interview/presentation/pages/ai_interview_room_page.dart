import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/kiosk/kiosk_mode_service.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_room_notifier.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/services/interview_speech_service.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_room_chat_panel.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_room_stage.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: room.phase == AiRoomPhase.deviceCheck
            ? AppBar(
                title: const Text('Kiểm tra thiết bị'),
                centerTitle: true,
              )
            : AppBar(
                title: Text(
                  room.phaseName ?? 'Phỏng vấn AI',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => _confirmExit(context),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(3),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: room.progress),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    builder: (_, value, __) => LinearProgressIndicator(
                      value: value,
                      minHeight: 3,
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
        body: switch (room.phase) {
          AiRoomPhase.deviceCheck => _DeviceCheck(
              onConfirm: () => ref
                  .read(aiInterviewRoomProvider(widget.sessionKey).notifier)
                  .confirmDeviceCheck(),
            ),
          AiRoomPhase.loading || AiRoomPhase.starting => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(
                    'Đang khởi tạo phòng phỏng vấn...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ).animate().fadeIn().scale(begin: const Offset(0.96, 0.96)),
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
          _ => Column(
              children: [
                Expanded(
                  flex: 4,
                  child: AiRoomStage(room: room),
                ),
                Expanded(
                  flex: 6,
                  child: AiRoomChatPanel(
                    room: room,
                    answerCtrl: _answerCtrl,
                    scrollCtrl: _scrollCtrl,
                    speech: _speech,
                    sessionKey: widget.sessionKey,
                  ),
                ),
              ],
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
          Icon(
            Icons.headset_mic_rounded,
            size: 72,
            color: Theme.of(context).colorScheme.primary,
          ).animate().scale(
                begin: const Offset(0.9, 0.9),
                duration: 500.ms,
                curve: Curves.easeOutBack,
              ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Kiểm tra micro, loa và camera trước khi bắt đầu',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: 'Sẵn sàng — Bắt đầu',
            icon: Icons.play_arrow_rounded,
            onPressed: onConfirm,
          ),
        ],
      ).animate().fadeIn(duration: 400.ms),
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
            Icon(
              Icons.celebration_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(label: actionLabel, onPressed: onAction),
          ],
        ).animate().fadeIn().slideY(begin: 0.06),
      ),
    );
  }
}
