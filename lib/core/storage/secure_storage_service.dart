import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _kJwtKey = 'jwt';
const _kAuthPayloadKey = 'auth_payload';

final secureStorageProvider = Provider<SecureStorageService>(
  (ref) => const SecureStorageService(),
);

class SecureStorageService {
  const SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<String?> readJwt() => _storage.read(key: _kJwtKey);

  Future<void> writeJwt(String token) => _storage.write(key: _kJwtKey, value: token);

  Future<void> deleteJwt() => _storage.delete(key: _kJwtKey);

  Future<String?> readAuthPayload() => _storage.read(key: _kAuthPayloadKey);

  Future<void> writeAuthPayload(String json) =>
      _storage.write(key: _kAuthPayloadKey, value: json);

  /// Explicit key deletion — more reliable than [deleteAll] on some Android builds.
  Future<void> clearAll() async {
    await Future.wait([
      deleteJwt(),
      _storage.delete(key: _kAuthPayloadKey),
    ]);
  }
}
