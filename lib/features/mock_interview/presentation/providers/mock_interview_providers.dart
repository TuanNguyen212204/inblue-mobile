import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/mock_interview/data/datasources/mock_interview_remote_datasource.dart';
import 'package:inblue_mobile/features/mock_interview/domain/entities/mock_session.dart';

import 'package:inblue_mobile/core/network/api_client_provider.dart';

final mockInterviewRemoteProvider =
    Provider<MockInterviewRemoteDataSource>((ref) {
  return MockInterviewRemoteDataSource(
    ref.watch(dioProvider),
    sessionApi: ref.watch(sessionControllerApiProvider),
    mentorApi: ref.watch(mentorControllerApiProvider),
  );
});

final mockSessionListProvider =
    FutureProvider.autoDispose<List<MockSession>>((ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return [];
  return ref.read(mockInterviewRemoteProvider).getSessionsByUser(userId);
});

final mockSessionDetailProvider =
    FutureProvider.autoDispose.family<MockSession, int>((ref, id) async {
  return ref.read(mockInterviewRemoteProvider).getSession(id);
});

final mockMentorsProvider = FutureProvider.autoDispose((ref) async {
  return ref.read(mockInterviewRemoteProvider).getMentors();
});
