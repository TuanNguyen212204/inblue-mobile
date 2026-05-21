import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';

/// Be Vietnam Pro — optimized for Vietnamese diacritics.
abstract final class AppTypography {
  static TextTheme textTheme({double scaleOffset = 0}) {
    final base = GoogleFonts.beVietnamProTextTheme();
    return base.copyWith(
      displayLarge: _style(base.displayLarge, 32, FontWeight.w700, scaleOffset),
      headlineMedium: _style(base.headlineMedium, 22, FontWeight.w600, scaleOffset),
      titleMedium: _style(base.titleMedium, 20, FontWeight.w600, scaleOffset),
      bodyLarge: _style(base.bodyLarge, 16, FontWeight.w400, scaleOffset),
      bodyMedium: _style(base.bodyMedium, 16, FontWeight.w400, scaleOffset),
      labelLarge: _style(base.labelLarge, 16, FontWeight.w600, scaleOffset),
      bodySmall: _style(base.bodySmall, 13, FontWeight.w400, scaleOffset, color: AppColors.onSurface.withValues(alpha: 0.7)),
    );
  }

  static TextStyle? _style(
    TextStyle? base,
    double size,
    FontWeight weight,
    double scale, {
    Color? color,
  }) =>
      base?.copyWith(
        fontSize: size + scale,
        fontWeight: weight,
        color: color ?? AppColors.onSurface,
      );
}
