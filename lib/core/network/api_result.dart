import 'package:fpdart/fpdart.dart';
import 'package:inblue_mobile/core/errors/exceptions.dart';
import 'package:inblue_mobile/core/errors/failures.dart';

/// Maps Dio / datasource exceptions to domain [Failure].
Failure mapExceptionToFailure(Object error) {
  return switch (error) {
    UnauthorizedException() => AuthFailure(error.message),
    NetworkException() => NetworkFailure(error.message),
    ServerException() => ServerFailure(error.message),
    CacheException() => CacheFailure(error.message),
    _ => ServerFailure(error.toString()),
  };
}

typedef ApiResult<T> = Either<Failure, T>;
