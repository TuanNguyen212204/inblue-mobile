import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';

/// Be Vietnam Pro — optimized for Vietnamese diacritics.
abstract final class AppTypography {
  static TextTheme textTheme({double scaleOffset = 0, bool isDark = false}) {
    final base = GoogleFonts.beVietnamProTextTheme();
    final onSurface = isDark ? AppColors.darkOnSurface : AppColors.onSurface;
    return base.copyWith(
      displayLarge: _style(base.displayLarge, 32, FontWeight.w700, scaleOffset, onSurface),
      headlineMedium: _style(base.headlineMedium, 22, FontWeight.w600, scaleOffset, onSurface),
      titleMedium: _style(base.titleMedium, 20, FontWeight.w600, scaleOffset, onSurface),
      bodyLarge: _style(base.bodyLarge, 16, FontWeight.w400, scaleOffset, onSurface),
      bodyMedium: _style(base.bodyMedium, 16, FontWeight.w400, scaleOffset, onSurface),
      labelLarge: _style(base.labelLarge, 16, FontWeight.w600, scaleOffset, onSurface),
      bodySmall: _style(
        base.bodySmall,
        13,
        FontWeight.w400,
        scaleOffset,
        onSurface,
        color: onSurface.withValues(alpha: 0.7),
      ),
    );
  }

  static TextStyle? _style(
    TextStyle? base,
    double size,
    FontWeight weight,
    double scale,
    Color onSurface, {
    Color? color,
  }) =>
      base?.copyWith(
        fontSize: size + scale,
        fontWeight: weight,
        color: color ?? onSurface,
      );
}
