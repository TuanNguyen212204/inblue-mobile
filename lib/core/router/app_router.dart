import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_room_page.dart';
import 'package:inblue_mobile/features/kiosk/presentation/pages/kiosk_session_entry_page.dart';

final appRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: RoutePaths.kioskEntry,
    routes: [
      GoRoute(
        path: RoutePaths.kioskEntry,
        builder: (_, __) => const KioskSessionEntryPage(),
      ),
      GoRoute(
        path: RoutePaths.aiInterviewSession,
        builder: (_, state) => AiInterviewRoomPage(
          sessionKey: state.pathParameters['sessionKey']!,
        ),
      ),
    ],
  ),
);
