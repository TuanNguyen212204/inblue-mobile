import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';

class CandidateProfileRemoteDataSource {
  CandidateProfileRemoteDataSource(this._dio);

  final Dio _dio;

  Future<CandidateProfile?> getByUserId(int userId) async {
    try {
      final res = await _dio.get<dynamic>(
        ApiPaths.candidateProfile(userId),
      );
      final map = _unwrapMap(res.data);
      if (map.isEmpty) return null;
      return CandidateProfile.fromJson(map);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<CandidateProfile> createProfile(CandidateProfile profile) async {
    try {
      final res = await _dio.post<dynamic>(
        ApiPaths.candidateProfiles,
        data: profile.toJson(userId: profile.userId!, forCreate: true),
      );
      return CandidateProfile.fromJson(_unwrapMap(res.data));
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<CandidateProfile> updateProfile(CandidateProfile profile) async {
    try {
      final res = await _dio.put<dynamic>(
        ApiPaths.candidateProfiles,
        data: profile.toJson(userId: profile.userId!),
      );
      return CandidateProfile.fromJson(_unwrapMap(res.data));
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Map<String, dynamic> _unwrapMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      final nested = data['data'] ?? data['result'] ?? data['profile'];
      if (nested is Map<String, dynamic>) return nested;
      if (nested is Map) return Map<String, dynamic>.from(nested);
      return data;
    }
    if (data is Map) {
      final nested = data['data'] ?? data['result'] ?? data['profile'];
      if (nested is Map) return Map<String, dynamic>.from(nested);
      return Map<String, dynamic>.from(data);
    }
    return {};
  }

  /// Multipart: `userId` as JSON blob + `cvFile` PDF only (parity web).
  Future<CandidateProfile> uploadCv({
    required int userId,
    required File file,
  }) async {
    final name = file.path.split(Platform.pathSeparator).last;
    if (!name.toLowerCase().endsWith('.pdf')) {
      throw Exception('Chỉ hỗ trợ file PDF');
    }

    try {
      final formData = FormData.fromMap({
        'userId': MultipartFile.fromString(
          userId.toString(),
          contentType: DioMediaType.parse('application/json'),
        ),
        'cvFile': await MultipartFile.fromFile(
          file.path,
          filename: name,
          contentType: DioMediaType.parse('application/pdf'),
        ),
      });

      final res = await _dio.post<Map<String, dynamic>>(
        ApiPaths.uploadCv,
        data: formData,
      );
      return CandidateProfile.fromJson(res.data ?? {});
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }
}
