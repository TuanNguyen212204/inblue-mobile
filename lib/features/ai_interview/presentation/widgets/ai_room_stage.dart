import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_room_notifier.dart';

/// Immersive AI avatar stage with pulse when thinking or listening.
/// Shows a live camera self-view in the top-right corner.
class AiRoomStage extends StatefulWidget {
  const AiRoomStage({
    required this.room,
    super.key,
  });

  final AiRoomState room;

  @override
  State<AiRoomStage> createState() => _AiRoomStageState();
}

class _AiRoomStageState extends State<AiRoomStage> {
  CameraController? _cameraController;
  bool _cameraReady = false;
  bool _cameraInitFailed = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (mounted) setState(() => _cameraInitFailed = true);
        return;
      }
      final front = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        front,
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _cameraController = controller;
        _cameraReady = true;
      });
    } catch (_) {
      if (mounted) setState(() => _cameraInitFailed = true);
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final thinking = widget.room.phase == AiRoomPhase.submitting ||
        widget.room.phase == AiRoomPhase.evaluating;
    final isListening = widget.room.isListening;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            scheme.primary.withValues(alpha: 0.95),
            AppColors.brightBlue.withValues(alpha: 0.8),
            AppColors.darkNavy.withValues(alpha: 0.9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: thinking ? 0.45 : 0.25),
            blurRadius: thinking ? 28 : 16,
            spreadRadius: thinking ? 2 : 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Pulse wave ring animation ────────────────────────────────────
          if (thinking || isListening)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: RadialGradient(
                    colors: [
                      (isListening ? Colors.lightBlueAccent : Colors.white)
                          .withValues(alpha: 0.18),
                      Colors.transparent,
                    ],
                  ),
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .scale(
                    begin: const Offset(0.92, 0.92),
                    end: const Offset(1.08, 1.08),
                    duration: 1600.ms,
                  ),
            ),

          // ── Status Pill Tag (top-left) ──────────────────────────────────
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: thinking
                          ? Colors.amberAccent
                          : isListening
                              ? Colors.redAccent
                              : Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    thinking
                        ? 'AI ĐANG XỬ LÝ'
                        : isListening
                            ? 'ĐANG THU ÂM'
                            : 'AI ACTIVE',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── AI avatar + status text ────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white30, width: 1.5),
                  ),
                  child: Icon(
                    thinking ? Icons.psychology_alt_rounded : Icons.smart_toy_rounded,
                    size: 52,
                    color: Colors.white,
                  ),
                )
                    .animate(
                      onPlay: thinking ? (c) => c.repeat(reverse: true) : null,
                    )
                    .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.08, 1.08),
                      duration: 1200.ms,
                    ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  thinking
                      ? 'AI đang suy nghĩ...'
                      : isListening
                          ? 'Đang lắng nghe câu trả lời'
                          : 'Trợ lý phỏng vấn AI',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                ),
                if (isListening) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Hãy nói rõ ràng vào micro thiết bị',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // ── Self-view camera (top-right) ───────────────────────────────
          Positioned(
            top: 12,
            right: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 90,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white30),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 8),
                  ],
                ),
                child: _buildSelfView(),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms);
  }

  Widget _buildSelfView() {
    if (_cameraReady && _cameraController != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.14159),
            child: CameraPreview(_cameraController!),
          ),
          Positioned(
            bottom: 3,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black45,
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: const Text(
                'BẠN · LIVE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.videocam_rounded, color: Colors.white70, size: 22),
        const SizedBox(height: 2),
        Text(
          _cameraInitFailed ? 'Không có camera' : 'Self-View',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 9),
        ),
      ],
    );
  }
}
