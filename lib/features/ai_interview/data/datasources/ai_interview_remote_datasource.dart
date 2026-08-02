import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';

class AiInterviewRemoteDataSource {
  AiInterviewRemoteDataSource(this._dio);

  final Dio _dio;

  Future<InterviewConfigOptions> getConfigOptions() async {
    final res = await _dio.get<dynamic>(
      ApiPaths.interviewConfigOptions,
    );
    return InterviewConfigOptions.fromJson(_unwrapMap(res.data));
  }

  Future<Map<String, dynamic>> generateJobRequirement(String description) async {
    final res = await _dio.post<dynamic>(
      ApiPaths.interviewGenerateJd,
      data: description,
      options: Options(contentType: 'application/json'),
    );
    return _unwrapMap(res.data);
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
    final res = await _dio.get<dynamic>(
      ApiPaths.interviewSessionsByUser(userId),
    );
    return _unwrapList(res.data)
        .map((e) => InterviewSession.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<InterviewSession> getSessionById(int id) async {
    final res = await _dio.get<dynamic>(
      ApiPaths.interviewSessionById(id),
    );
    return InterviewSession.fromJson(_unwrapMap(res.data));
  }

  Future<Map<String, dynamic>> getCache(String sessionKey) async {
    final res = await _dio.get<dynamic>(
      ApiPaths.interviewCache(sessionKey),
    );
    return _unwrapMap(res.data);
  }

  Future<QuestionResponse> startInterview(String sessionKey) async {
    final res = await _dio.get<dynamic>(
      ApiPaths.interviewStart(sessionKey),
    );
    return QuestionResponse.fromJson(_unwrapMap(res.data));
  }

  Future<List<Map<String, dynamic>>> getPracticeSetsByInterview(int sessionId) async {
    final res = await _dio.get<dynamic>(
      ApiPaths.practiceSetsByInterview(sessionId),
    );
    return _unwrapList(res.data)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  List<dynamic> _unwrapList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      for (final key in ['data', 'content', 'items', 'sessions']) {
        final nested = data[key];
        if (nested is List) return nested;
      }
    }
    return const [];
  }

  Map<String, dynamic> _unwrapMap(dynamic data) {
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
