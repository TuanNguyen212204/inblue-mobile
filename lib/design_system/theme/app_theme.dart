import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/theme/app_theme_extensions.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_typography.dart';

abstract final class AppTheme {
  static ThemeData light({double typographyScale = 0}) =>
      _build(brightness: Brightness.light, typographyScale: typographyScale);

  static ThemeData dark({double typographyScale = 0}) =>
      _build(brightness: Brightness.dark, typographyScale: typographyScale);

  static ThemeData _build({
    required Brightness brightness,
    double typographyScale = 0,
  }) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = isDark
        ? const ColorScheme.dark(
            primary: AppColors.darkPrimary,
            onPrimary: Colors.white,
            secondary: AppColors.brightBlue,
            onSecondary: Colors.white,
            surface: AppColors.darkSurface,
            onSurface: AppColors.darkOnSurface,
            surfaceContainerHighest: AppColors.darkSurfaceContainer,
            outline: Color(0xFF2D3F5C),
            error: AppColors.destructive,
            onError: Colors.white,
          )
        : ColorScheme.fromSeed(
            seedColor: AppColors.cobaltBlue,
            primary: AppColors.cobaltBlue,
            secondary: AppColors.brightBlue,
            surface: AppColors.aliceBlue,
            surfaceContainerHighest: AppColors.veryLightBlue,
            error: AppColors.destructive,
            brightness: Brightness.light,
          );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isDark ? AppColors.darkBackground : AppColors.aliceBlue,
      textTheme: AppTypography.textTheme(
        scaleOffset: typographyScale,
        isDark: isDark,
      ),
      extensions: const [AppThemeTokens.defaults],
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.cobaltBlue,
        foregroundColor: isDark ? AppColors.darkOnSurface : AppColors.onPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 48,
        titleTextStyle: AppTypography.textTheme(isDark: isDark)
            .titleMedium
            ?.copyWith(
              color: isDark ? AppColors.darkOnSurface : AppColors.onPrimary,
              fontWeight: FontWeight.w600,
            ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(120, 48),
          backgroundColor:
              isDark ? AppColors.darkPrimary : AppColors.cobaltBlue,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(120, 48),
          foregroundColor:
              isDark ? AppColors.darkPrimary : AppColors.cobaltBlue,
          side: BorderSide(
            color: isDark ? AppColors.darkPrimary : AppColors.cobaltBlue,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
        ),
      ),
      cardTheme: CardThemeData(
        color: isDark ? AppColors.darkSurfaceContainer : AppColors.veryLightBlue,
        elevation: isDark ? 2 : 0,
        shadowColor: isDark ? Colors.black54 : null,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.darkSurface : Colors.white,
        border: OutlineInputBorder(borderRadius: AppRadius.button),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 64,
        backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
        indicatorColor: (isDark ? AppColors.darkPrimary : AppColors.cobaltBlue)
            .withValues(alpha: 0.15),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: isDark
                ? AppColors.darkOnSurface.withValues(alpha: selected ? 1 : 0.65)
                : AppColors.onSurface.withValues(alpha: selected ? 1 : 0.6),
          );
        }),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
      dividerTheme: DividerThemeData(
        color: (isDark ? AppColors.darkOnSurface : AppColors.onSurface)
            .withValues(alpha: 0.08),
        space: 1,
        thickness: 1,
      ),
    );
  }
}
