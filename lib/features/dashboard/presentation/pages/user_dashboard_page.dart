import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/design_system/components/app_premium_bottom_nav.dart';

/// User shell — [StatefulNavigationShell] keeps tab state without layout glitches.
class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppPremiumBottomNav(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
