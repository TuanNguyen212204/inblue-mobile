import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_list_page.dart';
import 'package:inblue_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:inblue_mobile/features/dashboard/presentation/pages/user_dashboard_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/mock_interview_list_page.dart';
import 'package:inblue_mobile/features/notifications/presentation/pages/notifications_page.dart';
import 'package:inblue_mobile/features/profile/presentation/pages/profile_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isLoginRoute = state.matchedLocation == RoutePaths.login;

      if (!isLoggedIn && !isLoginRoute) return RoutePaths.login;
      if (isLoggedIn && (isLoginRoute || state.matchedLocation == RoutePaths.splash)) {
        return RoutePaths.dashboard;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.login,
        builder: (_, __) => const LoginPage(),
      ),
      ShellRoute(
        builder: (_, __, child) => UserDashboardPage(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.dashboard,
            redirect: (_, __) => RoutePaths.aiInterviewList,
          ),
          GoRoute(
            path: RoutePaths.aiInterviewList,
            builder: (_, __) => const AiInterviewListPage(),
          ),
          GoRoute(
            path: RoutePaths.mockInterviewList,
            builder: (_, __) => const MockInterviewListPage(),
          ),
          GoRoute(
            path: RoutePaths.notifications,
            builder: (_, __) => const NotificationsPage(),
          ),
          GoRoute(
            path: RoutePaths.profile,
            builder: (_, __) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
});
