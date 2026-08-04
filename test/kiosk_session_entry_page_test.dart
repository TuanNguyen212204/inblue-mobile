import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/theme/app_theme.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/pages/ai_interview_room_page.dart';
import 'package:inblue_mobile/features/kiosk/presentation/pages/kiosk_session_entry_page.dart';

void main() {
  group('KioskSessionEntryPage', () {
    testWidgets('shows validation when SessionKey is empty', (tester) async {
      final router = _router();
      addTearDown(router.dispose);
      await tester.pumpWidget(_app(router));
      await tester.pump(const Duration(milliseconds: 400));

      await tester.tap(find.text('Vào phòng phỏng vấn'));
      await tester.pump();

      expect(
        find.text('Vui lòng nhập SessionKey để tiếp tục.'),
        findsOneWidget,
      );
      expect(router.routeInformationProvider.value.uri.path, '/');
    });

    testWidgets('trims a valid SessionKey and opens its interview route',
        (tester) async {
      final router = _router();
      addTearDown(router.dispose);
      await tester.pumpWidget(_app(router));

      await tester.enterText(find.byType(TextFormField), '  abc-123-xyz  ');
      await tester.tap(find.text('Vào phòng phỏng vấn'));
      await tester.pumpAndSettle();

      expect(find.text('session:abc-123-xyz'), findsOneWidget);
      expect(
        router.routeInformationProvider.value.uri.path,
        '/session/abc-123-xyz',
      );
    });
  });

  testWidgets('finished state returns automatically after three seconds',
      (tester) async {
    var returned = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: KioskInterviewFinishedState(
          onAutoReturn: () => returned = true,
        ),
      ),
    );

    expect(find.text('Phỏng vấn hoàn tất!'), findsOneWidget);
    expect(find.text('Xem kết quả chi tiết'), findsNothing);

    await tester.pump(const Duration(seconds: 3));

    expect(returned, isTrue);
  });
}

MaterialApp _app(GoRouter router) => MaterialApp.router(
      theme: AppTheme.light(),
      routerConfig: router,
    );

GoRouter _router() => GoRouter(
      initialLocation: RoutePaths.kioskEntry,
      routes: [
        GoRoute(
          path: RoutePaths.kioskEntry,
          builder: (_, __) => const KioskSessionEntryPage(),
        ),
        GoRoute(
          path: RoutePaths.aiInterviewSession,
          builder: (_, state) => Scaffold(
            body: Text('session:${state.pathParameters['sessionKey']}'),
          ),
        ),
      ],
    );
