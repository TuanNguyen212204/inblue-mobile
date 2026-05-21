import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';

/// User shell — parity with web `UserDashboard` ChromeTabs.
class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indexForLocation(location),
        onDestinationSelected: (index) {
          switch (index) {
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
        destinations: const [
          NavigationDestination(icon: Icon(Icons.smart_toy_outlined), label: 'AI'),
          NavigationDestination(icon: Icon(Icons.people_outline), label: 'Mock'),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            label: 'Thông báo',
          ),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Hồ sơ'),
        ],
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
