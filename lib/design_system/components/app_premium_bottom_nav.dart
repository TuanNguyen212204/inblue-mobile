import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class AppPremiumBottomNav extends StatelessWidget {
  const AppPremiumBottomNav({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static const _items = [
    _NavItem(Icons.smart_toy_outlined, Icons.smart_toy, 'AI'),
    _NavItem(Icons.people_outline, Icons.people, 'Mock'),
    _NavItem(Icons.notifications_outlined, Icons.notifications, 'Thông báo'),
    _NavItem(Icons.person_outline, Icons.person, 'Hồ sơ'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.sm,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: isDark ? 0.82 : 0.92),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.navBarShadow.withValues(alpha: isDark ? 0.35 : 0.18),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              backgroundColor: Colors.transparent,
              elevation: 0,
              height: 64,
              indicatorShape: const StadiumBorder(),
              destinations: [
                for (var i = 0; i < _items.length; i++)
                  NavigationDestination(
                    icon: Icon(_items[i].outline),
                    selectedIcon: Icon(_items[i].filled),
                    label: _items[i].label,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.outline, this.filled, this.label);
  final IconData outline;
  final IconData filled;
  final String label;
}
