import 'package:flutter/foundation.dart';

/// Notifies [GoRouter] to re-run [GoRouter.redirect] without recreating the router.
class RouterRefreshNotifier extends ChangeNotifier {
  void notifyRouter() => notifyListeners();
}
