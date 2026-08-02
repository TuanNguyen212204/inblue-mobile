import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/features/mock_interview/domain/entities/mentor.dart';
import 'package:inblue_mobile/features/mock_interview/domain/entities/mock_session.dart';

class MockInterviewRemoteDataSource {
  MockInterviewRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<Mentor>> getMentors() async {
    final res = await _dio.get<dynamic>(ApiPaths.mentors);
    final list = _unwrapList(res.data);
    return list
        .map((e) => Mentor.fromJson(Map<String, dynamic>.from(e as Map)))
        .where((m) => m.active != false)
        .toList();
  }

  List<dynamic> _unwrapList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      for (final key in ['data', 'content', 'items', 'mentors']) {
        final nested = data[key];
        if (nested is List) return nested;
      }
    }
    return const [];
  }

  Future<Mentor> getMentor(int id) async {
    final res = await _dio.get<dynamic>(ApiPaths.mentorById(id));
    return Mentor.fromJson(_unwrapMap(res.data));
  }

  Future<List<MockSession>> getSessionsByUser(int userId) async {
    final res = await _dio.get<dynamic>(ApiPaths.sessionsByUser(userId));
    return _unwrapList(res.data)
        .map((e) => MockSession.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<MockSession> getSession(int id) async {
    final res = await _dio.get<dynamic>(ApiPaths.sessionById(id));
    return MockSession.fromJson(_unwrapMap(res.data));
  }

  Future<MockSession> createSession(Map<String, dynamic> body) async {
    final res = await _dio.post<dynamic>(
      ApiPaths.sessionCreate,
      data: body,
    );
    return MockSession.fromJson(_unwrapMap(res.data));
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

  Future<String> makePayment(int sessionId) async {
    final res = await _dio.get<dynamic>(
      ApiPaths.sessionMakePayment,
      queryParameters: {'sessionId': sessionId},
    );
    return _extractPaymentUrl(res.data);
  }

  Future<void> transferOut({
    required int amount,
    required int userId,
  }) async {
    await _dio.post<dynamic>(
      ApiPaths.transactionTransferOut,
      queryParameters: {
        'amount': amount,
        'userId': userId,
        'paymentPurpose': 'MENTOR_INTERVIEW',
      },
    );
  }

  Future<MockSession> updateSession(Map<String, dynamic> body) async {
    final res = await _dio.put<Map<String, dynamic>>(
      ApiPaths.sessionUpdate,
      data: body,
    );
    return MockSession.fromJson(res.data ?? {});
  }

  Future<void> joinSession({
    required String sessionName,
    required int userId,
    required String participantId,
    required bool isMentor,
  }) async {
    await _dio.post<dynamic>(
      ApiPaths.sessionJoin,
      data: {
        'sessionName': sessionName,
        'userId': userId,
        'participantId': participantId,
        'isMentor': isMentor,
      },
    );
  }

  Future<void> createMentorFeedback(Map<String, dynamic> body) async {
    await _dio.post<dynamic>(ApiPaths.mentorFeedbacks, data: body);
  }

  String _extractPaymentUrl(dynamic data) {
    if (data is String && data.startsWith('http')) return data;
    if (data is Map) {
      for (final key in [
        'checkoutUrl',
        'paymentUrl',
        'redirectUrl',
        'link',
        'url',
      ]) {
        final v = data[key];
        if (v is String && v.startsWith('http')) return v;
      }
      final nested = data['data'];
      if (nested is Map) return _extractPaymentUrl(nested);
    }
    throw Exception('Không lấy được URL thanh toán');
  }
}

String normalizeRoomUrl(String? url) {
  if (url == null || url.isEmpty) return '';
  if (url.startsWith('http')) return url;
  return 'https://$url';
}
