import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      // Prefer front camera for self-view
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

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            scheme.primary.withValues(alpha: 0.92),
            scheme.secondary.withValues(alpha: 0.75),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: thinking ? 0.5 : 0.28),
            blurRadius: thinking ? 28 : 16,
            spreadRadius: thinking ? 2 : 0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Pulse animation overlay ────────────────────────────────────
          if (thinking || widget.room.isListening)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1.05, 1.05),
                    duration: 1800.ms,
                  ),
            ),

          // ── AI avatar + status text ────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  thinking ? Icons.psychology_alt_rounded : Icons.smart_toy_rounded,
                  size: 64,
                  color: Colors.white,
                )
                    .animate(
                      onPlay: thinking ? (c) => c.repeat(reverse: true) : null,
                    )
                    .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.06, 1.06),
                      duration: 1200.ms,
                    ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  thinking
                      ? 'AI đang suy nghĩ...'
                      : widget.room.isListening
                          ? 'Đang lắng nghe bạn'
                          : 'Trợ lý phỏng vấn AI',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                ),
                if (widget.room.isListening) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Nói rõ ràng vào micro',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 13,
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
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white24),
                ),
                child: _buildSelfView(),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildSelfView() {
    if (_cameraReady && _cameraController != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          // Mirror the preview so it looks natural (front camera)
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.14159), // horizontal flip
            child: CameraPreview(_cameraController!),
          ),
          const Positioned(
            bottom: 3,
            left: 0,
            right: 0,
            child: Text(
              'Bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    }
    // Fallback: camera not available or error
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.videocam_rounded, color: Colors.white70, size: 20),
        const SizedBox(height: 2),
        Text(
          _cameraInitFailed ? 'Không có\ncamera' : 'Self-View',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 9),
        ),
      ],
    );
  }
}
