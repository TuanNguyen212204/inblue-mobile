import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';
import 'package:inblue_mobile/core/storage/secure_storage_service.dart';
import 'package:inblue_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:inblue_mobile/features/auth/data/datasources/user_remote_datasource.dart';
import 'package:inblue_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:inblue_mobile/features/auth/domain/repositories/auth_repository.dart';

import 'package:inblue_mobile/core/network/api_client_provider.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    ref.watch(authControllerApiProvider),
    ref.watch(dioProvider),
  );
});

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImpl(ref.watch(dioProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remote: ref.watch(authRemoteDataSourceProvider),
    secureStorage: ref.watch(secureStorageProvider),
  );
});
