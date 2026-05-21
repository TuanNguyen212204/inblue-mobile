import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/config/app_config.dart';
import 'package:inblue_mobile/core/config/env_config.dart';
import 'package:inblue_mobile/core/network/interceptors/auth_interceptor.dart';
import 'package:inblue_mobile/core/network/interceptors/logging_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.apiTimeout,
      sendTimeout: AppConfig.apiTimeout,
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(ref),
    if (EnvConfig.debugCurl) LoggingInterceptor(),
  ]);

  return dio;
});
