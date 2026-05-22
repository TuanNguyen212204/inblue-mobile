import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';

/// Ambient gradient mesh with soft floating orbs — auth & hero screens.
class AppGradientMeshBackground extends StatelessWidget {
  const AppGradientMeshBackground({
    super.key,
    this.child,
    this.intensity = 1,
  });

  final Widget? child;
  final double intensity;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;
    final accent = isDark ? AppColors.meshAccentDark : AppColors.meshAccentLight;
    final base = Theme.of(context).scaffoldBackgroundColor;

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                base,
                Color.lerp(base, primary, 0.08 * intensity)!,
                base,
              ],
            ),
          ),
        ),
        _Orb(
          color: primary.withValues(alpha: isDark ? 0.22 : 0.18),
          size: 220,
          top: -40,
          left: -30,
          delayMs: 0,
        ),
        _Orb(
          color: accent.withValues(alpha: isDark ? 0.16 : 0.14),
          size: 180,
          bottom: 120,
          right: -20,
          delayMs: 400,
        ),
        _Orb(
          color: AppColors.gold.withValues(alpha: isDark ? 0.06 : 0.08),
          size: 120,
          top: math.min(MediaQuery.sizeOf(context).height * 0.35, 280),
          right: 48,
          delayMs: 800,
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({
    required this.color,
    required this.size,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.delayMs = 0,
  });

  final Color color;
  final double size;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final int delayMs;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, color.withValues(alpha: 0)],
          ),
        ),
      )
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
            begin: const Offset(0.92, 0.92),
            end: const Offset(1.08, 1.08),
            duration: 4200.ms,
            delay: delayMs.ms,
            curve: Curves.easeInOut,
          )
          .moveY(begin: -6, end: 6, duration: 5200.ms, delay: delayMs.ms),
    );
  }
}
