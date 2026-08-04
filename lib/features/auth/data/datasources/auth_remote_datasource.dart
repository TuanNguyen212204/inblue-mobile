import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:inblue_api/inblue_api.dart';
import 'package:inblue_mobile/core/errors/exceptions.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';


abstract interface class AuthRemoteDataSource {
  Future<String> login({required String email, required String password});
  Future<void> forgotPassword({required String email});
  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
  Future<String?> googleLoginUrl();
  Future<void> register({
    required String email,
    required String password,
    required String name,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._authApi, this._dio);

  final AuthControllerApi _authApi;
  final Dio _dio;

  @override
  Future<String> login({required String email, required String password}) async {
    // NOTE: _authApi.login uses built_value which serializes LoginRequest as a
    // flat List (['email', val, 'password', val]) instead of a JSON Object.
    // We bypass the generated serializer and call the endpoint directly with
    // a proper Map body.
    try {
      final response = await _dio.post<dynamic>(
        '/api/auth/login',
        data: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );
      // ResponseUnwrapInterceptor + jsonDecode already handled the wrapper.
      // After that, response.data is the raw JWT string.
      final raw = response.data;
      final token = (raw is String ? raw : raw?.toString())?.trim();
      if (token == null || token.isEmpty) {
        throw const ServerException('Empty JWT response');
      }
      return token;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException();
      }
      throw NetworkException(ErrorNormalizer.fromDio(e), cause: e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _dio.post<dynamic>(
        'https://api.kdz.asia/api/auth/register',
        data: {
          'email': email,
          'password': password,
          'name': name,
          'role': 'USER',
        },
      );
    } on DioException catch (e) {
      throw NetworkException(ErrorNormalizer.fromDio(e), cause: e);
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      final req = ForgotPasswordRequest((b) => b..email = email);
      await _authApi.forgotPassword(forgotPasswordRequest: req);
    } on DioException catch (e) {
      throw NetworkException(ErrorNormalizer.fromDio(e), cause: e);
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final req = ResetPasswordRequest((b) => b
        ..email = email
        ..otp = otp
        ..newPassword = newPassword,
      );
      await _authApi.resetPassword(resetPasswordRequest: req);
    } on DioException catch (e) {
      throw NetworkException(ErrorNormalizer.fromDio(e), cause: e);
    }
  }

  @override
  Future<String?> googleLoginUrl() async {
    try {
      final res = await _authApi.googleLogin();
      return res.data?.url;
    } on DioException catch (e) {
      throw NetworkException(ErrorNormalizer.fromDio(e), cause: e);
    }
  }
}
