import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/errors/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<String> login({required String email, required String password}) async {
    try {
      final response = await _dio.post<String>(
        ApiPaths.authLogin,
        data: {'email': email, 'password': password},
        options: Options(responseType: ResponseType.plain),
      );
      final token = response.data?.trim();
      if (token == null || token.isEmpty) {
        throw const ServerException('Empty JWT response');
      }
      return token;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException();
      }
      throw NetworkException(e.message ?? 'Network error', cause: e);
    }
  }
}
