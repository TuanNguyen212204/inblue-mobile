import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';

/// Light glassmorphism panel — borders + blur, works in light & dark.
class AppGlassSurface extends StatelessWidget {
  const AppGlassSurface({
    required this.child,
    super.key,
    this.padding,
    this.borderRadius,
    this.blur = 12,
    this.opacity,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double blur;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = Theme.of(context).colorScheme.surface;
    final fillOpacity = opacity ?? (isDark ? 0.55 : 0.72);
    final radius = borderRadius ?? AppRadius.card;

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: surface.withValues(alpha: fillOpacity),
            border: Border.all(
              color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? Colors.black : AppColors.navBarShadow)
                    .withValues(alpha: isDark ? 0.35 : 0.12),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    );
  }
}
