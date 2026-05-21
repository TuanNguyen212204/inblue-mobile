import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/ai_interview/data/datasources/ai_interview_remote_datasource.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_session.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_providers.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class AiInterviewListState {
  const AiInterviewListState({
    required this.sessions,
    this.active,
    this.search = '',
  });

  final List<InterviewSession> sessions;
  final InterviewSession? active;
  final String search;

  List<InterviewSession> get history {
    final q = search.trim().toLowerCase();
    return sessions.where((s) {
      if (s.sessionKey == active?.sessionKey) return false;
      if (q.isEmpty) return true;
      return (s.mode ?? '').toLowerCase().contains(q) ||
          (s.domain ?? '').toLowerCase().contains(q);
    }).toList()
      ..sort((a, b) => (b.createdAt ?? '').compareTo(a.createdAt ?? ''));
  }
}

final aiInterviewListNotifierProvider =
    AsyncNotifierProvider<AiInterviewListNotifier, AiInterviewListState>(
  AiInterviewListNotifier.new,
);

class AiInterviewListNotifier extends AsyncNotifier<AiInterviewListState> {
  AiInterviewRemoteDataSource get _ds => ref.read(aiInterviewRemoteProvider);

  @override
  Future<AiInterviewListState> build() async => _load();

  Future<AiInterviewListState> _load() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return const AiInterviewListState(sessions: []);
    }
    final sessions = await _ds.getSessionsByUser(userId);
    InterviewSession? active;
    for (final s in sessions) {
      if (s.isInProgress &&
          s.sessionKey != null &&
          !isInterviewSessionExpired(s.createdAt)) {
        active = s;
        break;
      }
    }
    return AiInterviewListState(sessions: sessions, active: active);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _load());
  }

  void setSearch(String value) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData(current.copyWith(search: value));
  }
}

extension on AiInterviewListState {
  AiInterviewListState copyWith({
    List<InterviewSession>? sessions,
    InterviewSession? active,
    String? search,
  }) =>
      AiInterviewListState(
        sessions: sessions ?? this.sessions,
        active: active ?? this.active,
        search: search ?? this.search,
      );
}
