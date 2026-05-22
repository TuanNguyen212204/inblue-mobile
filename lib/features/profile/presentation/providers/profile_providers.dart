import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';
import 'package:inblue_mobile/features/ai_interview/data/datasources/candidate_profile_remote_datasource.dart';
import 'package:inblue_mobile/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:inblue_mobile/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:inblue_mobile/features/profile/domain/repositories/profile_repository.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>((ref) {
  return ProfileRemoteDataSource(ref.watch(dioProvider));
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(
    ref.watch(profileRemoteDataSourceProvider),
    CandidateProfileRemoteDataSource(ref.watch(dioProvider)),
  );
});
