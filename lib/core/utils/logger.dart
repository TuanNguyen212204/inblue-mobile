import 'package:flutter/foundation.dart';

abstract final class AppLogger {
  static void d(String message, {Object? error, StackTrace? stack}) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[InBlue] $message${error != null ? ' | $error' : ''}');
      if (stack != null) {
        // ignore: avoid_print
        print(stack);
      }
    }
  }
}
