import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/kiosk/kiosk_mode_service.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_gradient_mesh_background.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/components/app_status_badge.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_room_notifier.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/services/interview_speech_service.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_room_chat_panel.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/ai_room_stage.dart';

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
    final scheme = Theme.of(context).colorScheme;

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
                title: const Text('Kiểm tra thiết bị & Kết nối'),
                centerTitle: true,
              )
            : AppBar(
                title: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      room.phaseName ?? 'Phỏng vấn AI',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => _confirmExit(context),
                    icon: const Icon(Icons.close_rounded),
                    tooltip: 'Thoát phòng phỏng vấn',
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
                      backgroundColor: scheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
        body: switch (room.phase) {
          AiRoomPhase.deviceCheck => _DeviceCheck(
              speechService: _speech,
              onConfirm: () => ref
                  .read(aiInterviewRoomProvider(widget.sessionKey).notifier)
                  .confirmDeviceCheck(),
            ),
          AiRoomPhase.loading || AiRoomPhase.starting => AppGradientMeshBackground(
              child: Center(
                child: AppGlassSurface(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: scheme.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.psychology_rounded,
                          size: 48,
                          color: scheme.primary,
                        ),
                      )
                          .animate(onPlay: (c) => c.repeat(reverse: true))
                          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1)),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'Đang kết nối phòng phỏng vấn AI...',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Vui lòng chờ trong giây lát',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          AiRoomPhase.expired || AiRoomPhase.error => _EndState(
              message: room.errorMessage ?? 'Phiên không khả dụng',
              actionLabel: 'Nhập SessionKey khác',
              onAction: () => context.go(RoutePaths.kioskEntry),
            ),
          AiRoomPhase.finished => KioskInterviewFinishedState(
              onAutoReturn: () => context.go(RoutePaths.kioskEntry),
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
        shape: RoundedRectangleBorder(borderRadius: AppRadius.card),
        title: const Text('Rời khỏi buổi phỏng vấn?'),
        content: const Text(
          'Tiến trình trả lời của bạn sẽ được bảo lưu tự động trong 1 giờ.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Ở lại'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Rời khỏi'),
          ),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      await KioskModeService.exit();
      if (!context.mounted) return;
      context.go(RoutePaths.kioskEntry);
    }
  }
}

class KioskInterviewFinishedState extends StatefulWidget {
  const KioskInterviewFinishedState({
    required this.onAutoReturn,
    super.key,
  });

  final VoidCallback onAutoReturn;

  @override
  State<KioskInterviewFinishedState> createState() =>
      _KioskInterviewFinishedStateState();
}

class _KioskInterviewFinishedStateState
    extends State<KioskInterviewFinishedState> {
  int _secondsRemaining = 4;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future<void>.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      if (_secondsRemaining <= 1) {
        widget.onAutoReturn();
      } else {
        setState(() => _secondsRemaining--);
        _startCountdown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppGradientMeshBackground(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: AppGlassSurface(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.xxl,
            ),
            borderRadius: BorderRadius.circular(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: scheme.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.verified_rounded,
                    size: 64,
                    color: scheme.primary,
                  ),
                ).animate().scale(
                      begin: const Offset(0.8, 0.8),
                      duration: 500.ms,
                      curve: Curves.easeOutBack,
                    ),
                const SizedBox(height: AppSpacing.lg),
                AppStatusBadge(
                  label: 'HOÀN THÀNH PHỎNG VẤN',
                  backgroundColor: scheme.primary.withValues(alpha: 0.15),
                  foregroundColor: scheme.primary,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Cảm ơn bạn đã hoàn thành buổi phỏng vấn!',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Kết quả và phản hồi chi tiết đã được ghi nhận trên hệ thống.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: scheme.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Quay về màn hình chính sau ${_secondsRemaining}s...',
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn().slideY(begin: 0.04),
          ),
        ),
      ),
    );
  }
}

class _DeviceCheck extends StatefulWidget {
  const _DeviceCheck({
    required this.onConfirm,
    required this.speechService,
  });

  final VoidCallback onConfirm;
  final InterviewSpeechService speechService;

  @override
  State<_DeviceCheck> createState() => _DeviceCheckState();
}

class _DeviceCheckState extends State<_DeviceCheck> {
  bool _audioTested = false;

  void _testAudio() {
    setState(() => _audioTested = true);
    widget.speechService.speak('Kiểm tra âm thanh thành công. Loa hoạt động tốt.');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppGradientMeshBackground(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: AppGlassSurface(
              padding: const EdgeInsets.all(AppSpacing.xl),
              borderRadius: BorderRadius.circular(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: scheme.primary.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      size: 48,
                      color: scheme.primary,
                    ),
                  ).animate().scale(
                        begin: const Offset(0.9, 0.9),
                        duration: 400.ms,
                        curve: Curves.easeOutBack,
                      ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Kiểm tra thiết bị & âm thanh',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Đảm bảo micro và loa của bạn hoạt động rõ ràng trước khi vào phỏng vấn.',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),

                  // Checklist items
                  const _CheckTile(
                    icon: Icons.mic_rounded,
                    title: 'Micro & Nhận diện giọng nói',
                    subtitle: 'Hệ thống đã sẵn sàng thu âm',
                    isOk: true,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const _CheckTile(
                    icon: Icons.videocam_rounded,
                    title: 'Camera trước',
                    subtitle: 'Tự động hiển thị góc xem bản thân',
                    isOk: true,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _CheckTile(
                    icon: Icons.volume_up_rounded,
                    title: 'Thử nghiệm giọng đọc AI (TTS)',
                    subtitle: _audioTested
                        ? 'Đã phát âm thanh thử nghiệm'
                        : 'Bấm để nghe giọng thử nghiệm',
                    isOk: _audioTested,
                    trailing: TextButton.icon(
                      onPressed: _testAudio,
                      icon: const Icon(Icons.play_arrow_rounded, size: 18),
                      label: Text(_audioTested ? 'Phát lại' : 'Nghe thử'),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  AppPrimaryButton(
                    label: 'Sẵn sàng — Bắt đầu phỏng vấn',
                    icon: Icons.play_arrow_rounded,
                    onPressed: widget.onConfirm,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckTile extends StatelessWidget {
  const _CheckTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isOk,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isOk;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: scheme.outline.withValues(alpha: 0.12),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isOk
                  ? scheme.primary.withValues(alpha: 0.15)
                  : scheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: scheme.primary, size: 22),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (trailing != null)
            trailing!
          else
            Icon(
              Icons.check_circle_rounded,
              color: scheme.primary,
              size: 22,
            ),
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
    final scheme = Theme.of(context).colorScheme;

    return AppGradientMeshBackground(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: AppGlassSurface(
            padding: const EdgeInsets.all(AppSpacing.xl),
            borderRadius: BorderRadius.circular(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 56,
                  color: scheme.error,
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
            ),
          ),
        ),
      ),
    );
  }
}
