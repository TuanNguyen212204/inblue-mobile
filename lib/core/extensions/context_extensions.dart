import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/theme/app_theme_extensions.dart';

extension BuildContextX on BuildContext {
  AppThemeTokens get tokens => Theme.of(this).extension<AppThemeTokens>()!;
}
