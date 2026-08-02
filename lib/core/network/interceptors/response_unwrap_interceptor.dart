import 'package:dio/dio.dart';

/// Interceptor that automatically unwraps backend response wrappers
/// formatted as `{ "traceId": "...", "data": T }` or `{ "data": T }`.
class ResponseUnwrapInterceptor extends Interceptor {
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (data is Map) {
      if (data.containsKey('data') && data['data'] != null) {
        response.data = data['data'];
      }
    }
    handler.next(response);
  }
}
