import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads environment from [assets/env/.env] (copy from `.env.example` for local dev).
abstract final class EnvConfig {
  static const envAssetPath = 'assets/env/.env';

  static const _defaultApiBaseUrl = 'https://api.kdz.asia';

  static String _dotenvGet(String key, {String fallback = ''}) {
    try {
      return dotenv.get(key, fallback: fallback);
    } catch (_) {
      return fallback;
    }
  }

  static String get apiBaseUrl {
    final url = _dotenvGet(
      'API_BASE_URL',
      fallback: _dotenvGet('VITE_API_BASE_URL', fallback: _defaultApiBaseUrl),
    );
    return url.isEmpty ? _defaultApiBaseUrl : url;
  }

  static bool get debugCurl {
    final raw = _dotenvGet(
      'API_DEBUG_CURL',
      fallback: _dotenvGet('VITE_DEBUG_CURL', fallback: 'false'),
    );
    return raw.toLowerCase() == 'true';
  }
}

