import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads environment from [assets/env/.env] (copy from `.env.example` for local dev).
abstract final class EnvConfig {
  static const envAssetPath = 'assets/env/.env';

  static String get apiBaseUrl =>
      dotenv.get('API_BASE_URL', fallback: 'http://localhost:8080');

  static bool get debugCurl =>
      dotenv.get('API_DEBUG_CURL', fallback: 'false').toLowerCase() == 'true';
}
