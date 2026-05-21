import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

@immutable
class AppThemeTokens extends ThemeExtension<AppThemeTokens> {
  const AppThemeTokens({
    required this.spacing,
    required this.radius,
  });

  final AppSpacingTokens spacing;
  final AppRadiusTokens radius;

  static const defaults = AppThemeTokens(
    spacing: AppSpacingTokens(),
    radius: AppRadiusTokens(),
  );

  @override
  AppThemeTokens copyWith({
    AppSpacingTokens? spacing,
    AppRadiusTokens? radius,
  }) =>
      AppThemeTokens(
        spacing: spacing ?? this.spacing,
        radius: radius ?? this.radius,
      );

  @override
  AppThemeTokens lerp(ThemeExtension<AppThemeTokens>? other, double t) {
    if (other is! AppThemeTokens) return this;
    return other;
  }
}

@immutable
class AppSpacingTokens {
  const AppSpacingTokens();

  double get screen => AppSpacing.screenPaddingPhone;
  double get card => AppSpacing.cardPadding;
  double get section => AppSpacing.sectionGap;
}

@immutable
class AppRadiusTokens {
  const AppRadiusTokens();

  BorderRadius get button => AppRadius.button;
  BorderRadius get card => AppRadius.card;
}
