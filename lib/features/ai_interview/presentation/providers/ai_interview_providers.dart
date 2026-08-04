import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';
import 'package:inblue_mobile/features/ai_interview/data/datasources/ai_interview_remote_datasource.dart';

final aiInterviewRemoteProvider = Provider<AiInterviewRemoteDataSource>((ref) {
  return AiInterviewRemoteDataSource(ref.watch(dioProvider));
});
