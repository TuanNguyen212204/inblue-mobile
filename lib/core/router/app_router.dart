import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_list_page.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_result_page.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_room_page.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_setup_page.dart';
import 'package:inblue_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_state_provider.dart'
    show isAuthenticatedProvider;
import 'package:inblue_mobile/features/dashboard/presentation/pages/user_dashboard_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/mock_booking_success_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/mock_interview_list_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/mock_schedule_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/mock_session_detail_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/mock_video_room_page.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/pages/write_mentor_feedback_page.dart';
import 'package:inblue_mobile/features/notifications/presentation/pages/notifications_page.dart';
import 'package:inblue_mobile/features/profile/presentation/pages/profile_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAiKey = GlobalKey<NavigatorState>(debugLabel: 'shellAi');
final _shellNavigatorMockKey = GlobalKey<NavigatorState>(debugLabel: 'shellMock');
final _shellNavigatorNotifKey = GlobalKey<NavigatorState>(debugLabel: 'shellNotif');
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

Page<void> _noTransitionPage(Widget child) => NoTransitionPage(child: child);

final appRouterProvider = Provider<GoRouter>((ref) {
  // Only login/logout may recreate the router — not profile field updates.
  final isLoggedIn = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoginRoute = state.matchedLocation == RoutePaths.login;
      final loc = state.matchedLocation;

      if (!isLoggedIn && !isLoginRoute) return RoutePaths.login;
      if (isLoggedIn && (isLoginRoute || loc == RoutePaths.splash)) {
        return RoutePaths.dashboard;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.dashboard,
        redirect: (_, __) => RoutePaths.aiInterviewList,
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) =>
            UserDashboardPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAiKey,
            routes: [
              GoRoute(
                path: RoutePaths.aiInterviewList,
                pageBuilder: (_, __) =>
                    _noTransitionPage(const AiInterviewListPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMockKey,
            routes: [
              GoRoute(
                path: RoutePaths.mockInterviewList,
                pageBuilder: (_, __) =>
                    _noTransitionPage(const MockInterviewListPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorNotifKey,
            routes: [
              GoRoute(
                path: RoutePaths.notifications,
                pageBuilder: (_, __) =>
                    _noTransitionPage(const NotificationsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                pageBuilder: (_, __) => _noTransitionPage(const ProfilePage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.aiInterviewSetup,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const AiInterviewSetupPage(),
      ),
      GoRoute(
        path: RoutePaths.aiInterviewSession,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => AiInterviewRoomPage(
          sessionKey: state.pathParameters['sessionKey']!,
        ),
      ),
      GoRoute(
        path: RoutePaths.aiInterviewResult,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => AiInterviewResultPage(
          sessionId: int.parse(state.pathParameters['sessionId']!),
        ),
      ),
      GoRoute(
        path: RoutePaths.mockInterviewSchedule,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const MockSchedulePage(),
      ),
      GoRoute(
        path: RoutePaths.mockInterviewBookingSuccess,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const MockBookingSuccessPage(),
      ),
      GoRoute(
        path: RoutePaths.mockInterviewHistory,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => MockSessionDetailPage(
          sessionId: int.parse(state.pathParameters['sessionId']!),
        ),
      ),
      GoRoute(
        path: RoutePaths.mockInterviewRoom,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => MockVideoRoomPage(
          sessionId: int.parse(state.pathParameters['sessionId']!),
        ),
      ),
      GoRoute(
        path: RoutePaths.mockInterviewFeedback,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => WriteMentorFeedbackPage(
          sessionId: int.parse(state.pathParameters['sessionId']!),
        ),
      ),
    ],
  );
});
