import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_providers.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class AiSetupState {
  const AiSetupState({
    this.step = 0,
    this.configOptions,
    this.interviewMode,
    this.difficulty,
    this.language,
    this.domain,
    this.durationMinutes = 30,
    this.jdDescription = '',
    this.generatedJr,
    this.isGeneratingJd = false,
    this.isCreating = false,
    this.profileJson,
    this.hasProfile = false,
  });

  final int step;
  final InterviewConfigOptions? configOptions;
  final String? interviewMode;
  final String? difficulty;
  final String? language;
  final String? domain;
  final int durationMinutes;
  final String jdDescription;
  final Map<String, dynamic>? generatedJr;
  final bool isGeneratingJd;
  final bool isCreating;
  final Map<String, dynamic>? profileJson;
  final bool hasProfile;

  bool get step1Valid =>
      interviewMode != null &&
      difficulty != null &&
      language != null &&
      domain != null;

  bool get step3Valid => generatedJr != null;

  AiSetupState copyWith({
    int? step,
    InterviewConfigOptions? configOptions,
    String? interviewMode,
    String? difficulty,
    String? language,
    String? domain,
    int? durationMinutes,
    String? jdDescription,
    Map<String, dynamic>? generatedJr,
    bool? isGeneratingJd,
    bool? isCreating,
    Map<String, dynamic>? profileJson,
    bool? hasProfile,
  }) =>
      AiSetupState(
        step: step ?? this.step,
        configOptions: configOptions ?? this.configOptions,
        interviewMode: interviewMode ?? this.interviewMode,
        difficulty: difficulty ?? this.difficulty,
        language: language ?? this.language,
        domain: domain ?? this.domain,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        jdDescription: jdDescription ?? this.jdDescription,
        generatedJr: generatedJr ?? this.generatedJr,
        isGeneratingJd: isGeneratingJd ?? this.isGeneratingJd,
        isCreating: isCreating ?? this.isCreating,
        profileJson: profileJson ?? this.profileJson,
        hasProfile: hasProfile ?? this.hasProfile,
      );
}

final aiInterviewSetupNotifierProvider =
    AsyncNotifierProvider<AiInterviewSetupNotifier, AiSetupState>(
  AiInterviewSetupNotifier.new,
);

class AiInterviewSetupNotifier extends AsyncNotifier<AiSetupState> {
  @override
  Future<AiSetupState> build() async {
    final options =
        await ref.read(aiInterviewRemoteProvider).getConfigOptions();
    return AiSetupState(configOptions: options);
  }

  void setStep(int step) {
    state = AsyncData(state.requireValue.copyWith(step: step));
  }

  void selectConfig({
    String? interviewMode,
    String? difficulty,
    String? language,
    String? domain,
    int? durationMinutes,
  }) {
    state = AsyncData(
      state.requireValue.copyWith(
        interviewMode: interviewMode,
        difficulty: difficulty,
        language: language,
        domain: domain,
        durationMinutes: durationMinutes,
      ),
    );
  }

  void setJdDescription(String value) {
    state = AsyncData(state.requireValue.copyWith(jdDescription: value));
  }

  Future<void> generateJd() async {
    final current = state.requireValue;
    state = AsyncData(current.copyWith(isGeneratingJd: true));
    try {
      final jr = await ref.read(aiInterviewRemoteProvider).generateJobRequirement(
            current.jdDescription,
          );
      state = AsyncData(
        current.copyWith(generatedJr: jr, isGeneratingJd: false),
      );
    } catch (e) {
      state = AsyncData(current.copyWith(isGeneratingJd: false));
      rethrow;
    }
  }

  Future<String> createSession() async {
    final current = state.requireValue;
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) throw Exception('Not authenticated');

    state = AsyncData(current.copyWith(isCreating: true));
    try {
      final body = {
        'user_id': userId,
        'candidate_profile': current.profileJson ?? {'id': 0},
        'job_requirement': current.generatedJr,
        'session_config': {
          'duration_minutes': current.durationMinutes,
          'interview_mode': current.interviewMode,
          'difficulty': current.difficulty,
          'language': current.language,
          'domain': current.domain,
        },
      };
      final sessionKey =
          await ref.read(aiInterviewRemoteProvider).createSession(body);
      state = AsyncData(current.copyWith(isCreating: false));
      return sessionKey;
    } catch (e) {
      state = AsyncData(current.copyWith(isCreating: false));
      rethrow;
    }
  }
}
