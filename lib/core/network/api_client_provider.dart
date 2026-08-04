import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_api/inblue_api.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';

final inblueApiProvider = Provider<InblueApi>((ref) {
  final dio = ref.watch(dioProvider);
  return InblueApi(dio: dio);
});

final authControllerApiProvider = Provider<AuthControllerApi>((ref) {
  return ref.watch(inblueApiProvider).getAuthControllerApi();
});

final interviewSessionControllerApiProvider =
    Provider<InterviewSessionControllerApi>((ref) {
  return ref.watch(inblueApiProvider).getInterviewSessionControllerApi();
});

final sessionControllerApiProvider = Provider<SessionControllerApi>((ref) {
  return ref.watch(inblueApiProvider).getSessionControllerApi();
});

final mentorControllerApiProvider = Provider<MentorControllerApi>((ref) {
  return ref.watch(inblueApiProvider).getMentorControllerApi();
});

final notificationControllerApiProvider =
    Provider<NotificationControllerApi>((ref) {
  return ref.watch(inblueApiProvider).getNotificationControllerApi();
});
