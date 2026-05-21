import 'package:fpdart/fpdart.dart';
import 'package:inblue_mobile/core/errors/failures.dart';
import 'package:inblue_mobile/features/auth/domain/entities/auth_user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUser?>> getCurrentUser();

  Future<Either<Failure, Unit>> logout();
}
