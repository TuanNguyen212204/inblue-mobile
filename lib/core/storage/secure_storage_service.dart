import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _kJwtKey = 'jwt';
const _kAuthPayloadKey = 'auth_payload';

final secureStorageProvider = Provider<SecureStorageService>(
  (ref) => SecureStorageService(),
);

class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
            );

  final FlutterSecureStorage _storage;

  Future<String?> readJwt() async {
    try {
      return await _storage.read(key: _kJwtKey);
    } catch (_) {
      return null;
    }
  }

  Future<void> writeJwt(String token) async {
    try {
      await _storage.write(key: _kJwtKey, value: token);
    } catch (e) {
      try {
        await _storage.deleteAll();
        await _storage.write(key: _kJwtKey, value: token);
      } catch (_) {}
    }
  }

  Future<void> deleteJwt() async {
    try {
      await _storage.delete(key: _kJwtKey);
    } catch (_) {}
  }

  Future<String?> readAuthPayload() async {
    try {
      return await _storage.read(key: _kAuthPayloadKey);
    } catch (_) {
      return null;
    }
  }

  Future<void> writeAuthPayload(String json) async {
    try {
      await _storage.write(key: _kAuthPayloadKey, value: json);
    } catch (e) {
      try {
        await _storage.deleteAll();
        await _storage.write(key: _kAuthPayloadKey, value: json);
      } catch (_) {}
    }
  }

  /// Explicit key deletion — more reliable than [deleteAll] on some Android builds.
  Future<void> clearAll() async {
    try {
      await Future.wait([
        deleteJwt(),
        _storage.delete(key: _kAuthPayloadKey),
      ]);
    } catch (_) {
      try {
        await _storage.deleteAll();
      } catch (_) {}
    }
  }
}
