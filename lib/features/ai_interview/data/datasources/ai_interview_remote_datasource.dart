import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';

class AiInterviewRemoteDataSource {
  AiInterviewRemoteDataSource(this._dio);

  final Dio _dio;

  Future<InterviewConfigOptions> getConfigOptions() async {
    final res = await _dio.get<Map<String, dynamic>>(
      ApiPaths.interviewConfigOptions,
    );
    return InterviewConfigOptions.fromJson(res.data ?? {});
  }

  Future<Map<String, dynamic>> generateJobRequirement(String description) async {
    final res = await _dio.post<dynamic>(
      ApiPaths.interviewGenerateJd,
      data: description,
      options: Options(contentType: 'application/json'),
    );
    if (res.data is Map<String, dynamic>) return res.data as Map<String, dynamic>;
    return {};
  }

  Future<String> createSession(Map<String, dynamic> body) async {
    final res = await _dio.post<String>(
      ApiPaths.interviewCreateSession,
      data: body,
      options: Options(responseType: ResponseType.plain),
    );
    var key = (res.data ?? '').trim();
    if (key.startsWith('"') && key.endsWith('"')) {
      key = key.substring(1, key.length - 1);
    }
    return key;
  }

  Future<List<InterviewSession>> getSessionsByUser(int userId) async {
    final res = await _dio.get<List<dynamic>>(
      ApiPaths.interviewSessionsByUser(userId),
    );
    return (res.data ?? [])
        .map((e) => InterviewSession.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<InterviewSession> getSessionById(int id) async {
    final res = await _dio.get<Map<String, dynamic>>(
      ApiPaths.interviewSessionById(id),
    );
    return InterviewSession.fromJson(res.data ?? {});
  }

  Future<Map<String, dynamic>> getCache(String sessionKey) async {
    final res = await _dio.get<Map<String, dynamic>>(
      ApiPaths.interviewCache(sessionKey),
    );
    return res.data ?? {};
  }

  Future<QuestionResponse> startInterview(String sessionKey) async {
    final res = await _dio.get<Map<String, dynamic>>(
      ApiPaths.interviewStart(sessionKey),
    );
    return QuestionResponse.fromJson(res.data ?? {});
  }

  Future<List<Map<String, dynamic>>> getPracticeSetsByInterview(int sessionId) async {
    final res = await _dio.get<List<dynamic>>(
      ApiPaths.practiceSetsByInterview(sessionId),
    );
    return (res.data ?? []).cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> createPracticeSetByAi({
    required int aiInterviewId,
    required int dateNumber,
  }) async {
    try {
      final res = await _dio.post<List<dynamic>>(
        ApiPaths.practiceSetCreateByAi,
        data: {
          'aiInterviewId': aiInterviewId,
          'dateNumber': dateNumber,
        },
      );
      return (res.data ?? []).cast<Map<String, dynamic>>();
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
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
}
