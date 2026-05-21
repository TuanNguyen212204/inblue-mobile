import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Immersive kiosk helpers for AI interview room (spec section E).
abstract final class KioskModeService {
  static Future<void> enter() async {
    await WakelockPlus.enable();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  static Future<void> exit() async {
    await WakelockPlus.disable();
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
