import 'package:fpdart/fpdart.dart';
import 'package:inblue_mobile/core/errors/failures.dart';
import 'package:inblue_mobile/core/network/api_result.dart';
import 'package:inblue_mobile/core/storage/secure_storage_service.dart';
import 'package:inblue_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:inblue_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:inblue_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remote,
    required SecureStorageService secureStorage,
  })  : _remote = remote,
        _secureStorage = secureStorage;

  final AuthRemoteDataSource _remote;
  final SecureStorageService _secureStorage;

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await _remote.login(email: email, password: password);
      await _secureStorage.writeJwt(token);
      return right(token);
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, AuthUser?>> getCurrentUser() async {
    final jwt = await _secureStorage.readJwt();
    if (jwt == null) return right(null);
    // TODO: decode JWT or fetch /me when BE exposes profile endpoint
    return right(const AuthUser(id: 0, email: ''));
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _secureStorage.clearAll();
      return right(unit);
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }
}
