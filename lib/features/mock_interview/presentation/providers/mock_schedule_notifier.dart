import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/mock_interview/domain/entities/mentor.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_interview_providers.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class MockScheduleState {
  const MockScheduleState({
    this.step = 0,
    this.mentors = const [],
    this.selectedMentor,
    this.joinTime,
    this.durationMinutes = 60,
    this.isSubmitting = false,
    this.search = '',
  });

  final int step;
  final List<Mentor> mentors;
  final Mentor? selectedMentor;
  final DateTime? joinTime;
  final int durationMinutes;
  final bool isSubmitting;
  final String search;

  double get totalPrice {
    final rate = selectedMentor?.pricePerMinute ?? 0;
    return durationMinutes * rate;
  }

  List<Mentor> get filteredMentors {
    final q = search.trim().toLowerCase();
    if (q.isEmpty) return mentors;
    return mentors
        .where(
          (m) =>
              (m.name ?? '').toLowerCase().contains(q) ||
              (m.expertise ?? '').toLowerCase().contains(q),
        )
        .toList();
  }

  MockScheduleState copyWith({
    int? step,
    List<Mentor>? mentors,
    Mentor? selectedMentor,
    DateTime? joinTime,
    int? durationMinutes,
    bool? isSubmitting,
    String? search,
  }) =>
      MockScheduleState(
        step: step ?? this.step,
        mentors: mentors ?? this.mentors,
        selectedMentor: selectedMentor ?? this.selectedMentor,
        joinTime: joinTime ?? this.joinTime,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        search: search ?? this.search,
      );
}

final mockScheduleNotifierProvider =
    AsyncNotifierProvider<MockScheduleNotifier, MockScheduleState>(
  MockScheduleNotifier.new,
);

class MockScheduleNotifier extends AsyncNotifier<MockScheduleState> {
  @override
  Future<MockScheduleState> build() async {
    final mentors = await ref.read(mockInterviewRemoteProvider).getMentors();
    return MockScheduleState(mentors: mentors);
  }

  void setStep(int step) {
    state = AsyncData(state.requireValue.copyWith(step: step));
  }

  void setSearch(String value) {
    state = AsyncData(state.requireValue.copyWith(search: value));
  }

  void selectMentor(Mentor mentor) {
    state = AsyncData(state.requireValue.copyWith(selectedMentor: mentor));
  }

  void setJoinTime(DateTime value) {
    state = AsyncData(state.requireValue.copyWith(joinTime: value));
  }

  void setDuration(int minutes) {
    state = AsyncData(state.requireValue.copyWith(durationMinutes: minutes));
  }

  Future<int?> submit() async {
    final current = state.requireValue;
    final userId = ref.read(currentUserIdProvider);
    final mentor = current.selectedMentor;
    if (userId == null || mentor?.id == null || current.joinTime == null) {
      throw Exception('Thiếu thông tin đặt lịch');
    }
    if ((mentor!.pricePerMinute ?? 0) <= 0) {
      throw Exception('Mentor chưa có giá phút hợp lệ');
    }

    state = AsyncData(current.copyWith(isSubmitting: true));
    try {
      final session = await ref.read(mockInterviewRemoteProvider).createSession({
        'userId': userId,
        'mentorId': mentor.id,
        'joinTime': current.joinTime!.toUtc().toIso8601String(),
        'duration': current.durationMinutes,
        'totalPrice': current.totalPrice.round(),
        'dailyCoCreationRequest': {
          'name': '',
          'privacy': 'public',
          'properties': {
            'max_participants': 2,
            'start_video_off': true,
            'start_audio_off': true,
            'enable_screenshare': true,
            'exp': 0,
            'enable_recording': 'cloud',
          },
        },
      });
      state = AsyncData(current.copyWith(isSubmitting: false));
      return session.id;
    } catch (e) {
      state = AsyncData(current.copyWith(isSubmitting: false));
      rethrow;
    }
  }
}
