import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/errors/exceptions.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/auth/domain/entities/auth_user.dart';

abstract interface class UserRemoteDataSource {
  Future<AuthUser> fetchById(int userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<AuthUser> fetchById(int userId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.userById(userId),
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException('Empty user response');
      }
      return AuthUser.fromApiJson(_unwrapUserMap(data));
    } on DioException catch (e) {
      throw NetworkException(ErrorNormalizer.fromDio(e), cause: e);
    }
  }

  static Map<String, dynamic> _unwrapUserMap(Map<String, dynamic> raw) {
    final nested = raw['data'] ?? raw['user'] ?? raw['result'];
    if (nested is Map<String, dynamic>) return nested;
    if (nested is Map) return Map<String, dynamic>.from(nested);
    return raw;
  }
}
