import 'package:flutter/material.dart';

/// Brand palette — parity with web, extended for dark mode.
abstract final class AppColors {
  static const cobaltBlue = Color(0xFF0047AB);
  static const darkNavy = Color(0xFF002654);
  static const brightBlue = Color(0xFF007BFF);
  static const veryLightBlue = Color(0xFFDCEEFF);
  static const aliceBlue = Color(0xFFF0F8FF);
  static const gold = Color(0xFFFFD700);
  static const destructive = Color(0xFFDC2626);

  static const onPrimary = Colors.white;
  static const onSurface = Color(0xFF0F172A);

  // Dark palette
  static const darkBackground = Color(0xFF0B1220);
  static const darkSurface = Color(0xFF111B2E);
  static const darkSurfaceContainer = Color(0xFF1A2740);
  static const darkOnSurface = Color(0xFFE8EEF7);
  static const darkPrimary = Color(0xFF3B8BFF);
}
