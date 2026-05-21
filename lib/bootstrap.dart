import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/app.dart';
import 'package:inblue_mobile/core/config/env_config.dart';
import 'package:inblue_mobile/core/utils/logger.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _loadEnvironment();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const ProviderScope(
      child: InBlueApp(),
    ),
  );
}

Future<void> _loadEnvironment() async {
  try {
    await dotenv.load(fileName: EnvConfig.envAssetPath);
  } catch (e) {
    AppLogger.d(
      'Env file not found (${EnvConfig.envAssetPath}). Using fallbacks. '
      'Copy assets/env/.env.example → assets/env/.env for local dev.',
      error: e,
    );
  }
}
