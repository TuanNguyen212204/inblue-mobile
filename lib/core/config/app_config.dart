import 'package:inblue_mobile/core/config/env_config.dart';

/// App-wide immutable configuration (non-secret).
abstract final class AppConfig {
  static const appName = 'InBlue';
  static const candidateRole = 'USER';

  static String get apiBaseUrl => EnvConfig.apiBaseUrl;
  static const apiTimeout = Duration(seconds: 30);
  static const connectTimeout = Duration(seconds: 15);
}
