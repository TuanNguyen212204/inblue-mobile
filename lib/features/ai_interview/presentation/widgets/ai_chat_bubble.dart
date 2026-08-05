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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bg = isUser
        ? scheme.primary
        : scheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.7 : 0.9);
    final fg = isUser ? scheme.onPrimary : scheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.84,
        ),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 2,
        ),
        decoration: BoxDecoration(
          color: bg,
          gradient: isUser
              ? LinearGradient(
                  colors: [
                    scheme.primary,
                    scheme.secondary,
                  ],
                )
              : null,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
          border: isUser
              ? null
              : Border.all(
                  color: scheme.outline.withValues(alpha: 0.1),
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: fg,
                    height: 1.5,
                  ),
            ),
            if (!isUser && onReplayTts != null) ...[
              const SizedBox(height: 6),
              InkWell(
                onTap: onReplayTts,
                borderRadius: AppRadius.button,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8, // Ensures >= 48dp touch target
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.volume_up_rounded, size: 18, color: scheme.primary),
                      const SizedBox(width: 6),
                      Text(
                        'Nghe lại giọng đọc',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: scheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: 250.ms).slideX(
          begin: isUser ? 0.06 : -0.06,
          curve: Curves.easeOutCubic,
        );
  }
}
