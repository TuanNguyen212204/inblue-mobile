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
      final res = await _dio.get<Map<String, dynamic>>(
        ApiPaths.candidateProfile(userId),
      );
      return CandidateProfile.fromJson(res.data ?? {});
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<CandidateProfile> createProfile(CandidateProfile profile) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        ApiPaths.candidateProfiles,
        data: profile.toJson(userId: profile.userId!, forCreate: true),
      );
      return CandidateProfile.fromJson(res.data ?? {});
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<CandidateProfile> updateProfile(CandidateProfile profile) async {
    try {
      final res = await _dio.put<Map<String, dynamic>>(
        ApiPaths.candidateProfiles,
        data: profile.toJson(userId: profile.userId!),
      );
      return CandidateProfile.fromJson(res.data ?? {});
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
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
