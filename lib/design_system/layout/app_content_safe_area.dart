import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

/// Respects status bar / notch / Dynamic Island — use on full-screen scroll bodies.
class AppContentSafeArea extends StatelessWidget {
  const AppContentSafeArea({
    required this.child,
    super.key,
    this.includeBottom = false,
    this.minTop = AppSpacing.sm,
  });

  final Widget child;
  final bool includeBottom;
  final double minTop;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: includeBottom,
      minimum: EdgeInsets.only(top: minTop),
      child: child,
    );
  }
}
