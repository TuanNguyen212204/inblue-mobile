import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_premium_bottom_nav.dart';

/// User shell — parity with web `UserDashboard` ChromeTabs.
class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _indexForLocation(location);

    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: AppPremiumBottomNav(
        selectedIndex: index,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go(RoutePaths.aiInterviewList);
            case 1:
              context.go(RoutePaths.mockInterviewList);
            case 2:
              context.go(RoutePaths.notifications);
            case 3:
              context.go(RoutePaths.profile);
          }
        },
      ),
    );
  }

  int _indexForLocation(String location) {
    if (location.contains('mock-interview')) return 1;
    if (location.contains('notifications')) return 2;
    if (location.contains('profile')) return 3;
    return 0;
  }
}
