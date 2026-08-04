import 'dart:convert';
import 'package:dio/dio.dart';

/// Interceptor that automatically unwraps backend response wrappers
/// formatted as `{ "traceId": "...", "data": T }` or `{ "data": T }`.
class ResponseUnwrapInterceptor extends Interceptor {
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    var data = response.data;
    
    // Since we use ResponseType.plain globally, we must parse JSON manually.
    if (data is String) {
      try {
        data = jsonDecode(data);
        response.data = data;
      } catch (_) {
        // Not a valid JSON string (e.g. raw JWT token). Leave as String.
      }
    }

    if (data is Map) {
      if (data.containsKey('data') && data['data'] != null) {
        response.data = data['data'];
      }
    }
    handler.next(response);
  }
}
