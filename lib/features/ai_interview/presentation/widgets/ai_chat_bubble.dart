import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class AiChatBubble extends StatelessWidget {
  const AiChatBubble({
    required this.text,
    required this.isUser,
    super.key,
    this.onReplayTts,
  });

  final String text;
  final bool isUser;
  final VoidCallback? onReplayTts;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = isUser ? scheme.primary : scheme.surfaceContainerHighest;
    final fg = isUser ? scheme.onPrimary : scheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.82,
        ),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(14),
            topRight: const Radius.circular(14),
            bottomLeft: Radius.circular(isUser ? 14 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 14),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: fg, height: 1.45)),
            if (!isUser && onReplayTts != null) ...[
              const SizedBox(height: 6),
              InkWell(
                onTap: onReplayTts,
                borderRadius: AppRadius.button,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.volume_up_rounded, size: 18, color: fg),
                ),
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: 280.ms).slideX(
          begin: isUser ? 0.08 : -0.08,
          curve: Curves.easeOutCubic,
        );
  }
}
