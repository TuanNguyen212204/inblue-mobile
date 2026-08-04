import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';

class AiInterviewRemoteDataSource {
  AiInterviewRemoteDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getCache(String sessionKey) async {
    final res = await _dio.get<dynamic>(ApiPaths.interviewCache(sessionKey));
    return _parseMap(res.data);
  }

  Future<QuestionResponse> startInterview(String sessionKey) async {
    final res = await _dio.get<dynamic>(ApiPaths.interviewStart(sessionKey));
    return QuestionResponse.fromJson(_parseMap(res.data));
  }

  Future<QuestionResponse> submitAnswer({
    required String sessionKey,
    required String answer,
  }) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        ApiPaths.interviewSubmit,
        data: {'sessionKey': sessionKey, 'answer': answer},
      );
      return QuestionResponse.fromJson(res.data ?? {});
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Map<String, dynamic> _parseMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      final nested = data['data'];
      if (nested is Map<String, dynamic>) return nested;
      if (nested is Map) return Map<String, dynamic>.from(nested);
      return data;
    }
    if (data is Map) {
      final nested = data['data'];
      if (nested is Map) return Map<String, dynamic>.from(nested);
      return Map<String, dynamic>.from(data);
    }
    return {};
  }
}
