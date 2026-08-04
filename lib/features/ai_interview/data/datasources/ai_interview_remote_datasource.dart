import 'package:dio/dio.dart';
import 'package:inblue_api/inblue_api.dart'
    hide InterviewSession, QuestionResponse, InterviewSessionResponse;
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';

class AiInterviewRemoteDataSource {
  AiInterviewRemoteDataSource(this._dio, [InterviewSessionControllerApi? api])
      : _api = api ?? InterviewSessionControllerApi(_dio, standardSerializers);

  final Dio _dio;
  final InterviewSessionControllerApi _api;

  Future<InterviewConfigOptions> getConfigOptions() async {
    final res = await _api.getInterviewConfigOptions();
    final data = res.data;
    if (data != null) {
      final map = <String, dynamic>{};
      for (final entry in data.entries) {
        map[entry.key] = entry.value?.value;
      }
      return InterviewConfigOptions.fromJson(map);
    }
    final raw = await _dio.get<dynamic>(ApiPaths.interviewConfigOptions);
    return InterviewConfigOptions.fromJson(_parseMap(raw.data));
  }

  Future<Map<String, dynamic>> generateJobRequirement(String description) async {
    final res = await _dio.post<dynamic>(
      ApiPaths.interviewGenerateJd,
      data: description,
      options: Options(contentType: 'application/json'),
    );
    return _parseMap(res.data);
  }

  Future<String> createSession(Map<String, dynamic> body) async {
    final res = await _dio.post<String>(
      ApiPaths.interviewCreateSession,
      data: body,
      options: Options(responseType: ResponseType.plain),
    );
    var key = (res.data ?? '').trim();
    if (key.startsWith('"') && key.endsWith('"') && key.length >= 2) {
      key = key.substring(1, key.length - 1);
    }
    return key;
  }

  Future<List<InterviewSession>> getSessionsByUser(int userId) async {
    try {
      final res = await _api.getAllSessionsForUser(userId: userId);
      if (res.data != null) {
        return res.data!
            .map((e) => InterviewSession.fromJson({
                  'id': e.id,
                  'sessionKey': e.sessionKey,
                  'status': e.status,
                  'mode': e.mode,
                  'domain': e.domain,
                  'createdAt': e.createdAt?.toIso8601String(),
                  'completedAt': e.completedAt?.toIso8601String(),
                  'overallScore': e.overallScore,
                  'result': e.result,
                }))
            .toList();
      }
    } catch (_) {}
    final raw = await _dio.get<dynamic>(ApiPaths.interviewSessionsByUser(userId));
    return _parseList(raw.data)
        .map((e) => InterviewSession.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<InterviewSession> getSessionById(int id) async {
    final res = await _dio.get<dynamic>(ApiPaths.interviewSessionById(id));
    return InterviewSession.fromJson(_parseMap(res.data));
  }

  Future<Map<String, dynamic>> getCache(String sessionKey) async {
    final res = await _dio.get<dynamic>(ApiPaths.interviewCache(sessionKey));
    return _parseMap(res.data);
  }

  Future<QuestionResponse> startInterview(String sessionKey) async {
    final res = await _dio.get<dynamic>(ApiPaths.interviewStart(sessionKey));
    return QuestionResponse.fromJson(_parseMap(res.data));
  }

  Future<List<Map<String, dynamic>>> getPracticeSetsByInterview(int sessionId) async {
    final res = await _dio.get<dynamic>(ApiPaths.practiceSetsByInterview(sessionId));
    return _parseList(res.data).map((e) => Map<String, dynamic>.from(e as Map)).toList();
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

  List<dynamic> _parseList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      for (final key in ['data', 'content', 'items', 'sessions']) {
        final nested = data[key];
        if (nested is List) return nested;
      }
    }
    return const [];
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
