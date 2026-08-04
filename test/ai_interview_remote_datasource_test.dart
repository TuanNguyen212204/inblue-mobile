import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/features/ai_interview/data/datasources/ai_interview_remote_datasource.dart';

void main() {
  test('uses only the three kiosk interview REST APIs', () async {
    final requests = <RequestOptions>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          requests.add(options);
          final data = switch (options.path) {
            '/api/interview-sessions/cache/abc-123' => {
                'dbId': 42,
                'chatHistory': <Object?>[],
              },
            '/api/v1/interview/start/abc-123' => {
                'sessionKey': 'abc-123',
                'questionContent': 'Giới thiệu về bản thân bạn.',
                'finished': false,
              },
            '/api/v1/interview/submit' => {
                'sessionKey': 'abc-123',
                'questionContent': 'Câu hỏi tiếp theo',
                'finished': false,
              },
            _ => <String, dynamic>{},
          };
          handler
              .resolve(Response<dynamic>(requestOptions: options, data: data));
        },
      ),
    );
    final datasource = AiInterviewRemoteDataSource(dio);

    final cache = await datasource.getCache('abc-123');
    final start = await datasource.startInterview('abc-123');
    final submit = await datasource.submitAnswer(
      sessionKey: 'abc-123',
      answer: 'Câu trả lời',
    );

    expect(cache['dbId'], 42);
    expect(start.questionContent, 'Giới thiệu về bản thân bạn.');
    expect(submit.questionContent, 'Câu hỏi tiếp theo');
    expect(
      requests.map((request) => '${request.method} ${request.path}'),
      [
        'GET ${ApiPaths.interviewCache('abc-123')}',
        'GET ${ApiPaths.interviewStart('abc-123')}',
        'POST ${ApiPaths.interviewSubmit}',
      ],
    );
    expect(
      requests.last.data,
      {'sessionKey': 'abc-123', 'answer': 'Câu trả lời'},
    );
  });
}
