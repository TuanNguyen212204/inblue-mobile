/// Data-layer exceptions (thrown by datasources / Dio).
sealed class AppException implements Exception {
  const AppException(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => '$runtimeType: $message';
}

final class ServerException extends AppException {
  const ServerException(super.message, {super.cause, this.statusCode});

  final int? statusCode;
}

final class NetworkException extends AppException {
  const NetworkException(super.message, {super.cause});
}

final class CacheException extends AppException {
  const CacheException(super.message, {super.cause});
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException({String message = 'Email hoặc mật khẩu không chính xác.'})
      : super(message);
}
