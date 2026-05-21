import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/dio_client.dart';
import 'package:inblue_mobile/features/ai_interview/data/datasources/candidate_profile_remote_datasource.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';
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
    this.existingProfile,
    this.isEditingProfile = false,
    this.isSavingProfile = false,
    this.isUploadingCv = false,
    this.isLoadingProfile = false,
    this.form = const CandidateProfileForm.empty(),
    this.uploadedProfileId,
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
  final CandidateProfile? existingProfile;
  final bool isEditingProfile;
  final bool isSavingProfile;
  final bool isUploadingCv;
  final bool isLoadingProfile;
  final CandidateProfileForm form;
  final int? uploadedProfileId;

  bool get step1Valid =>
      interviewMode != null &&
      difficulty != null &&
      language != null &&
      domain != null;

  bool get hasExistingProfile => existingProfile?.hasValidId ?? false;

  /// Parity web: profile saved in DB and not in edit mode.
  bool get step2Valid => hasExistingProfile && !isEditingProfile;

  bool get step3Valid => generatedJr != null;

  Map<String, dynamic>? get profileJson => existingProfile != null
      ? existingProfile!.toJson(
          userId: existingProfile!.userId ?? 0,
          forCreate: false,
        )
      : null;

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
    CandidateProfile? existingProfile,
    bool? isEditingProfile,
    bool? isSavingProfile,
    bool? isUploadingCv,
    bool? isLoadingProfile,
    CandidateProfileForm? form,
    int? uploadedProfileId,
    bool clearUploadedProfileId = false,
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
        existingProfile: existingProfile ?? this.existingProfile,
        isEditingProfile: isEditingProfile ?? this.isEditingProfile,
        isSavingProfile: isSavingProfile ?? this.isSavingProfile,
        isUploadingCv: isUploadingCv ?? this.isUploadingCv,
        isLoadingProfile: isLoadingProfile ?? this.isLoadingProfile,
        form: form ?? this.form,
        uploadedProfileId: clearUploadedProfileId
            ? null
            : (uploadedProfileId ?? this.uploadedProfileId),
      );
}

/// Editable form mirror for step 2.
class CandidateProfileForm {
  const CandidateProfileForm({
    required this.targetRole,
    required this.targetLevel,
    required this.introduction,
    required this.technicalSkills,
    required this.softSkills,
    required this.tools,
    required this.certifications,
    required this.achievements,
  });

  const CandidateProfileForm.empty()
      : targetRole = '',
        targetLevel = '',
        introduction = '',
        technicalSkills = const [],
        softSkills = const [],
        tools = const [],
        certifications = const [],
        achievements = const [];

  final String targetRole;
  final String targetLevel;
  final String introduction;
  final List<String> technicalSkills;
  final List<String> softSkills;
  final List<String> tools;
  final List<String> certifications;
  final List<String> achievements;

  bool get canSave =>
      targetRole.trim().isNotEmpty && introduction.trim().isNotEmpty;

  factory CandidateProfileForm.fromProfile(CandidateProfile p) =>
      CandidateProfileForm(
        targetRole: p.targetRole ?? '',
        targetLevel: p.targetLevel ?? '',
        introduction: p.introduction ?? '',
        technicalSkills: List.from(p.technicalSkills),
        softSkills: List.from(p.softSkills),
        tools: List.from(p.tools),
        certifications: List.from(p.certifications),
        achievements: List.from(p.achievements),
      );

  CandidateProfileForm copyWith({
    String? targetRole,
    String? targetLevel,
    String? introduction,
    List<String>? technicalSkills,
    List<String>? softSkills,
    List<String>? tools,
    List<String>? certifications,
    List<String>? achievements,
  }) =>
      CandidateProfileForm(
        targetRole: targetRole ?? this.targetRole,
        targetLevel: targetLevel ?? this.targetLevel,
        introduction: introduction ?? this.introduction,
        technicalSkills: technicalSkills ?? this.technicalSkills,
        softSkills: softSkills ?? this.softSkills,
        tools: tools ?? this.tools,
        certifications: certifications ?? this.certifications,
        achievements: achievements ?? this.achievements,
      );
}

final candidateProfileRemoteProvider =
    Provider<CandidateProfileRemoteDataSource>((ref) {
  return CandidateProfileRemoteDataSource(ref.watch(dioProvider));
});

final aiInterviewSetupNotifierProvider =
    AsyncNotifierProvider<AiInterviewSetupNotifier, AiSetupState>(
  AiInterviewSetupNotifier.new,
);

class AiInterviewSetupNotifier extends AsyncNotifier<AiSetupState> {
  CandidateProfileRemoteDataSource get _profileDs =>
      ref.read(candidateProfileRemoteProvider);

  @override
  Future<AiSetupState> build() async {
    final options =
        await ref.read(aiInterviewRemoteProvider).getConfigOptions();
    final userId = ref.read(currentUserIdProvider);
    CandidateProfile? profile;
    if (userId != null) {
      profile = await _profileDs.getByUserId(userId);
      if (profile != null) {
        profile = CandidateProfile(
          id: profile.id,
          userId: userId,
          targetRole: profile.targetRole,
          targetLevel: profile.targetLevel,
          introduction: profile.introduction,
          technicalSkills: profile.technicalSkills,
          softSkills: profile.softSkills,
          tools: profile.tools,
          certifications: profile.certifications,
          achievements: profile.achievements,
          projects: profile.projects,
          workExperiences: profile.workExperiences,
          educations: profile.educations,
        );
      }
    }
    return AiSetupState(
      configOptions: options,
      existingProfile: profile,
      isEditingProfile: false,
    );
  }

  void setStep(int step) {
    final current = state.requireValue;
    state = AsyncData(current.copyWith(step: step));
    if (step == 1 && current.existingProfile == null) {
      _loadProfile();
    }
  }

  Future<void> _loadProfile() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    final current = state.requireValue;
    state = AsyncData(current.copyWith(isLoadingProfile: true));
    try {
      final profile = await _profileDs.getByUserId(userId);
      state = AsyncData(
        state.requireValue.copyWith(
          existingProfile: profile,
          isLoadingProfile: false,
          isEditingProfile: false,
        ),
      );
    } catch (e) {
      state = AsyncData(current.copyWith(isLoadingProfile: false));
      rethrow;
    }
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

  void startEditingProfile() {
    final current = state.requireValue;
    final form = current.existingProfile != null
        ? CandidateProfileForm.fromProfile(current.existingProfile!)
        : const CandidateProfileForm.empty();
    state = AsyncData(
      current.copyWith(isEditingProfile: true, form: form),
    );
  }

  void cancelEditingProfile() {
    state = AsyncData(
      state.requireValue.copyWith(
        isEditingProfile: false,
        form: const CandidateProfileForm.empty(),
        clearUploadedProfileId: true,
      ),
    );
  }

  void updateForm(CandidateProfileForm form) {
    state = AsyncData(state.requireValue.copyWith(form: form));
  }

  Future<void> uploadCv(File file) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    final current = state.requireValue;
    state = AsyncData(current.copyWith(isUploadingCv: true));
    try {
      final profile = await _profileDs.uploadCv(userId: userId, file: file);
      final form = CandidateProfileForm.fromProfile(profile);
      state = AsyncData(
        current.copyWith(
          isUploadingCv: false,
          isEditingProfile: true,
          form: form,
          uploadedProfileId: profile.id,
        ),
      );
    } catch (e) {
      state = AsyncData(current.copyWith(isUploadingCv: false));
      rethrow;
    }
  }

  Future<void> saveProfile() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    final current = state.requireValue;
    if (!current.form.canSave) {
      throw Exception('Vui lòng điền vị trí mục tiêu và giới thiệu');
    }

    state = AsyncData(current.copyWith(isSavingProfile: true));
    try {
      final existing = current.existingProfile;
      final resolvedId = existing?.id ?? current.uploadedProfileId;
      final isUpdate = resolvedId != null && resolvedId > 0;

      final body = CandidateProfile(
        id: isUpdate ? resolvedId : 0,
        userId: userId,
        targetRole: current.form.targetRole.trim(),
        targetLevel: current.form.targetLevel.trim(),
        introduction: current.form.introduction.trim(),
        technicalSkills: current.form.technicalSkills,
        softSkills: current.form.softSkills,
        tools: current.form.tools,
        certifications: current.form.certifications,
        achievements: current.form.achievements,
        projects: existing?.projects ?? [],
        workExperiences: existing?.workExperiences ?? [],
        educations: existing?.educations ?? [],
      );

      final saved = isUpdate
          ? await _profileDs.updateProfile(body)
          : await _profileDs.createProfile(body);

      final withUserId = CandidateProfile(
        id: saved.id,
        userId: userId,
        targetRole: saved.targetRole,
        targetLevel: saved.targetLevel,
        introduction: saved.introduction,
        technicalSkills: saved.technicalSkills,
        softSkills: saved.softSkills,
        tools: saved.tools,
        certifications: saved.certifications,
        achievements: saved.achievements,
        projects: saved.projects,
        workExperiences: saved.workExperiences,
        educations: saved.educations,
      );

      state = AsyncData(
        current.copyWith(
          existingProfile: withUserId,
          isSavingProfile: false,
          isEditingProfile: false,
          form: const CandidateProfileForm.empty(),
          clearUploadedProfileId: true,
        ),
      );
    } catch (e) {
      state = AsyncData(current.copyWith(isSavingProfile: false));
      rethrow;
    }
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
    if (!current.step2Valid || current.existingProfile == null) {
      throw Exception('Vui lòng lưu hồ sơ ứng viên trước');
    }

    state = AsyncData(current.copyWith(isCreating: true));
    try {
      final body = {
        'user_id': userId,
        'candidate_profile': current.existingProfile!.toJson(userId: userId),
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
