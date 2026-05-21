import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/theme/app_theme_extensions.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_typography.dart';

abstract final class AppTheme {
  static ThemeData light({double typographyScale = 0}) {
    const seed = AppColors.cobaltBlue;
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seed,
      primary: AppColors.cobaltBlue,
      secondary: AppColors.brightBlue,
      surface: AppColors.aliceBlue,
      error: AppColors.destructive,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.aliceBlue,
      textTheme: AppTypography.textTheme(scaleOffset: typographyScale),
      extensions: const [AppThemeTokens.defaults],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cobaltBlue,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(120, 48),
          backgroundColor: AppColors.cobaltBlue,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(120, 48),
          foregroundColor: AppColors.cobaltBlue,
          side: const BorderSide(color: AppColors.cobaltBlue),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.veryLightBlue,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: AppRadius.button),
      ),
    );
  }
}
