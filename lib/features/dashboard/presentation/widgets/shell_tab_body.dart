import 'package:flutter/material.dart';

/// Body for tabs inside [UserDashboardPage] — no nested [Scaffold].
abstract final class ShellTabLayout {
  /// Space for floating bottom nav + safe area.
  static const double bottomInset = 96;
}

class ShellTabBody extends StatelessWidget {
  const ShellTabBody({
    required this.child,
    super.key,
    this.bottomInset = ShellTabLayout.bottomInset,
  });

  final Widget child;
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }
}
