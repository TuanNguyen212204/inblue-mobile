import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_premium_text_field.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_empty_state.dart';

class CandidateProfileTab extends ConsumerStatefulWidget {
  const CandidateProfileTab({this.profile, super.key});

  final CandidateProfile? profile;

  @override
  ConsumerState<CandidateProfileTab> createState() => _CandidateProfileTabState();
}

class _ProjectEntry {
  _ProjectEntry({
    TextEditingController? name,
    TextEditingController? description,
    TextEditingController? role,
    TextEditingController? teamSize,
    TextEditingController? outcome,
    TextEditingController? usedTools,
  })  : name = name ?? TextEditingController(),
        description = description ?? TextEditingController(),
        role = role ?? TextEditingController(),
        teamSize = teamSize ?? TextEditingController(),
        outcome = outcome ?? TextEditingController(),
        usedTools = usedTools ?? TextEditingController();

  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController role;
  final TextEditingController teamSize;
  final TextEditingController outcome;
  final TextEditingController usedTools;

  void dispose() {
    name.dispose();
    description.dispose();
    role.dispose();
    teamSize.dispose();
    outcome.dispose();
    usedTools.dispose();
  }

  ProjectDetail toModel() => ProjectDetail(
        name: name.text.trim(),
        description: description.text.trim(),
        role: role.text.trim(),
        teamSize: int.tryParse(teamSize.text.trim()) ?? 1,
        outcome: outcome.text.trim(),
        usedTools: usedTools.text
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
      );
}

class _ExperienceEntry {
  _ExperienceEntry({
    TextEditingController? company,
    TextEditingController? position,
    TextEditingController? description,
    TextEditingController? startDate,
    TextEditingController? endDate,
  })  : company = company ?? TextEditingController(),
        position = position ?? TextEditingController(),
        description = description ?? TextEditingController(),
        startDate = startDate ?? TextEditingController(),
        endDate = endDate ?? TextEditingController();

  final TextEditingController company;
  final TextEditingController position;
  final TextEditingController description;
  final TextEditingController startDate;
  final TextEditingController endDate;

  void dispose() {
    company.dispose();
    position.dispose();
    description.dispose();
    startDate.dispose();
    endDate.dispose();
  }

  WorkExperience toModel() => WorkExperience(
        company: company.text.trim(),
        position: position.text.trim(),
        description: description.text.trim(),
        startDate: startDate.text.trim(),
        endDate: endDate.text.trim(),
      );
}

class _EducationEntry {
  _EducationEntry({
    TextEditingController? school,
    TextEditingController? major,
    TextEditingController? degree,
    TextEditingController? gpa,
    TextEditingController? startDate,
    TextEditingController? endDate,
  })  : school = school ?? TextEditingController(),
        major = major ?? TextEditingController(),
        degree = degree ?? TextEditingController(),
        gpa = gpa ?? TextEditingController(),
        startDate = startDate ?? TextEditingController(),
        endDate = endDate ?? TextEditingController();

  final TextEditingController school;
  final TextEditingController major;
  final TextEditingController degree;
  final TextEditingController gpa;
  final TextEditingController startDate;
  final TextEditingController endDate;

  void dispose() {
    school.dispose();
    major.dispose();
    degree.dispose();
    gpa.dispose();
    startDate.dispose();
    endDate.dispose();
  }

  EducationEntry toModel() => EducationEntry(
        school: school.text.trim(),
        major: major.text.trim(),
        degree: degree.text.trim(),
        gpa: gpa.text.trim(),
        startDate: startDate.text.trim(),
        endDate: endDate.text.trim(),
      );
}

class _CandidateProfileTabState extends ConsumerState<CandidateProfileTab> {
  bool _isEditing = false;
  bool _isSaving = false;
  bool _isUploading = false;

  late TextEditingController _roleCtrl;
  late TextEditingController _levelCtrl;
  late TextEditingController _introCtrl;
  late TextEditingController _techCtrl;
  late TextEditingController _softCtrl;
  late TextEditingController _toolsCtrl;

  final List<_ProjectEntry> _projects = [];
  final List<_ExperienceEntry> _experiences = [];
  final List<_EducationEntry> _educations = [];

  @override
  void initState() {
    super.initState();
    _roleCtrl = TextEditingController();
    _levelCtrl = TextEditingController();
    _introCtrl = TextEditingController();
    _techCtrl = TextEditingController();
    _softCtrl = TextEditingController();
    _toolsCtrl = TextEditingController();
    _syncFromProfile(widget.profile);
    _isEditing = widget.profile == null;
  }

  @override
  void didUpdateWidget(covariant CandidateProfileTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile?.id != widget.profile?.id) {
      _clearSections();
      _syncFromProfile(widget.profile);
      if (widget.profile != null) _isEditing = false;
    }
  }

  void _clearSections() {
    for (final e in _projects) {
      e.dispose();
    }
    for (final e in _experiences) {
      e.dispose();
    }
    for (final e in _educations) {
      e.dispose();
    }
    _projects.clear();
    _experiences.clear();
    _educations.clear();
  }

  void _syncFromProfile(CandidateProfile? p) {
    _clearSections();
    _roleCtrl.text = p?.targetRole ?? '';
    _levelCtrl.text = p?.targetLevel ?? '';
    _introCtrl.text = (p?.introduction ?? '').toString();
    _techCtrl.text = p?.technicalSkills.join(', ') ?? '';
    _softCtrl.text = p?.softSkills.join(', ') ?? '';
    _toolsCtrl.text = p?.tools.join(', ') ?? '';
    for (final ProjectDetail project in p?.projects ?? const []) {
      _projects.add(_ProjectEntry(
        name: TextEditingController(text: project.name?.toString() ?? ''),
        description: TextEditingController(text: project.description?.toString() ?? ''),
        role: TextEditingController(text: project.role?.toString() ?? ''),
        teamSize: TextEditingController(text: '${project.teamSize ?? 1}'),
        outcome: TextEditingController(text: project.outcome?.toString() ?? ''),
        usedTools: TextEditingController(text: project.usedTools.join(', ')),
      ));
    }
    for (final WorkExperience exp in p?.workExperiences ?? const []) {
      _experiences.add(_ExperienceEntry(
        company: TextEditingController(text: exp.company?.toString() ?? ''),
        position: TextEditingController(text: exp.position?.toString() ?? ''),
        description: TextEditingController(text: exp.description?.toString() ?? ''),
        startDate: TextEditingController(text: exp.startDate?.toString() ?? ''),
        endDate: TextEditingController(text: exp.endDate?.toString() ?? ''),
      ));
    }
    for (final EducationEntry edu in p?.educations ?? const []) {
      _educations.add(_EducationEntry(
        school: TextEditingController(text: edu.school?.toString() ?? ''),
        major: TextEditingController(text: edu.major?.toString() ?? ''),
        degree: TextEditingController(text: edu.degree?.toString() ?? ''),
        gpa: TextEditingController(text: edu.gpa?.toString() ?? ''),
        startDate: TextEditingController(text: edu.startDate?.toString() ?? ''),
        endDate: TextEditingController(text: edu.endDate?.toString() ?? ''),
      ));
    }
  }

  @override
  void dispose() {
    _clearSections();
    _roleCtrl.dispose();
    _levelCtrl.dispose();
    _introCtrl.dispose();
    _techCtrl.dispose();
    _softCtrl.dispose();
    _toolsCtrl.dispose();
    super.dispose();
  }

  List<String> _splitList(String raw) =>
      raw.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

  CandidateProfile _buildProfile() {
    final userId = ref.read(currentUserIdProvider)!;
    return CandidateProfile(
      id: widget.profile?.id,
      userId: userId,
      targetRole: _roleCtrl.text.trim(),
      targetLevel: _levelCtrl.text.trim(),
      introduction: _introCtrl.text.trim(),
      technicalSkills: _splitList(_techCtrl.text),
      softSkills: _splitList(_softCtrl.text),
      tools: _splitList(_toolsCtrl.text),
      projects: _projects.map((e) => e.toModel()).toList(),
      workExperiences: _experiences.map((e) => e.toModel()).toList(),
      educations: _educations.map((e) => e.toModel()).toList(),
      certifications: widget.profile?.certifications ?? [],
      achievements: widget.profile?.achievements ?? [],
    );
  }

  Future<void> _uploadCv() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
    );
    final path = result?.files.single.path;
    if (path == null) return;
    setState(() => _isUploading = true);
    try {
      await ref.read(accountNotifierProvider.notifier).uploadCandidateCv(File(path));
      if (mounted) {
        ProfileUiUtils.showToast(
          context,
          'Tải CV thành công! Kiểm tra và lưu hồ sơ.',
        );
        setState(() => _isEditing = true);
      }
    } catch (e) {
      if (mounted) {
        ProfileUiUtils.showToast(
          context,
          ProfileUiUtils.stripExceptionPrefix(e),
          isError: true,
        );
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  Future<void> _save() async {
    if (_roleCtrl.text.trim().isEmpty) {
      ProfileUiUtils.showToast(context, 'Vui lòng nhập vị trí mục tiêu', isError: true);
      return;
    }
    setState(() => _isSaving = true);
    try {
      await ref.read(accountNotifierProvider.notifier).saveCandidate(_buildProfile());
      if (mounted) {
        ProfileUiUtils.showToast(context, 'Đã lưu hồ sơ ứng viên thành công');
        setState(() => _isEditing = false);
      }
    } catch (e) {
      if (mounted) {
        ProfileUiUtils.showToast(
          context,
          ProfileUiUtils.stripExceptionPrefix(e),
          isError: true,
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isEditing && widget.profile != null) {
      return _SummaryView(
        profile: widget.profile!,
        onEdit: () => setState(() => _isEditing = true),
        onUploadCv: _isUploading ? null : _uploadCv,
        isUploading: _isUploading,
      );
    }

    if (!_isEditing && widget.profile == null) {
      return AppEmptyState(
        title: 'Chưa có hồ sơ ứng viên',
        subtitle: 'Tải CV PDF hoặc tạo hồ sơ thủ công',
        icon: Icons.description_outlined,
        action: Column(
          children: [
            AppPrimaryButton(
              label: _isUploading ? 'Đang tải CV...' : 'Tải CV (PDF)',
              onPressed: _isUploading ? null : _uploadCv,
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(
              onPressed: () => setState(() => _isEditing = true),
              child: const Text('Nhập thủ công'),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      children: [
        if (widget.profile != null)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => setState(() => _isEditing = false),
              child: const Text('Hủy'),
            ),
          ),
        OutlinedButton.icon(
          onPressed: _isUploading ? null : _uploadCv,
          icon: _isUploading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.upload_file_rounded),
          label: Text(_isUploading ? 'Đang tải CV...' : 'Tải CV PDF'),
        ),
        const SizedBox(height: AppSpacing.md),
        AppPremiumTextField(
          controller: _roleCtrl,
          label: 'Vị trí mục tiêu',
          prefixIcon: Icons.work_outline,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppPremiumTextField(
          controller: _levelCtrl,
          label: 'Cấp độ (Intern / Junior / ...)',
          prefixIcon: Icons.trending_up_outlined,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppPremiumTextField(
          controller: _introCtrl,
          label: 'Giới thiệu bản thân',
          prefixIcon: Icons.notes_outlined,
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppPremiumTextField(
          controller: _techCtrl,
          label: 'Kỹ năng kỹ thuật (phân cách bằng dấu phẩy)',
          prefixIcon: Icons.code_outlined,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppPremiumTextField(
          controller: _softCtrl,
          label: 'Kỹ năng mềm',
          prefixIcon: Icons.people_outline,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppPremiumTextField(
          controller: _toolsCtrl,
          label: 'Công cụ',
          prefixIcon: Icons.build_outlined,
        ),
        const SizedBox(height: AppSpacing.lg),
        _SectionHeader(
          title: 'Dự án',
          onAdd: () => setState(() => _projects.add(_ProjectEntry())),
        ),
        ..._projects.map((entry) => _ProjectCard(
              entry: entry,
              onRemove: () {
                entry.dispose();
                setState(() => _projects.remove(entry));
              },
            )),
        const SizedBox(height: AppSpacing.lg),
        _SectionHeader(
          title: 'Kinh nghiệm',
          onAdd: () => setState(() => _experiences.add(_ExperienceEntry())),
        ),
        ..._experiences.map((entry) => _ExperienceCard(
              entry: entry,
              onRemove: () {
                entry.dispose();
                setState(() => _experiences.remove(entry));
              },
            )),
        const SizedBox(height: AppSpacing.lg),
        _SectionHeader(
          title: 'Học vấn',
          onAdd: () => setState(() => _educations.add(_EducationEntry())),
        ),
        ..._educations.map((entry) => _EducationCard(
              entry: entry,
              onRemove: () {
                entry.dispose();
                setState(() => _educations.remove(entry));
              },
            )),
        const SizedBox(height: AppSpacing.lg),
        AppPrimaryButton(
          label: _isSaving ? 'Đang lưu...' : 'Lưu hồ sơ',
          onPressed: _isSaving ? null : _save,
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onAdd});

  final String title;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        IconButton.filledTonal(
          onPressed: onAdd,
          icon: const Icon(Icons.add_rounded, size: 18),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.entry, required this.onRemove});

  final _ProjectEntry entry;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppGlassSurface(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.folder_open_outlined, size: 18),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppPremiumTextField(
                    controller: entry.name,
                    label: 'Tên dự án',
                    prefixIcon: Icons.title,
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline_rounded, size: 18),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.description,
              label: 'Mô tả',
              prefixIcon: Icons.notes_outlined,
              maxLines: 2,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.role,
              label: 'Vai trò',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.teamSize,
              label: 'Quy mô nhóm',
              prefixIcon: Icons.group_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.outcome,
              label: 'Kết quả',
              prefixIcon: Icons.emoji_events_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.usedTools,
              label: 'Công nghệ dùng (phân cách bằng dấu phẩy)',
              prefixIcon: Icons.code_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.entry, required this.onRemove});

  final _ExperienceEntry entry;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppGlassSurface(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.work_outline, size: 18),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppPremiumTextField(
                    controller: entry.company,
                    label: 'Công ty',
                    prefixIcon: Icons.business_outlined,
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline_rounded, size: 18),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.position,
              label: 'Vị trí',
              prefixIcon: Icons.badge_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.description,
              label: 'Mô tả công việc',
              prefixIcon: Icons.notes_outlined,
              maxLines: 2,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.startDate,
              label: 'Từ ngày',
              prefixIcon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.endDate,
              label: 'Đến ngày',
              prefixIcon: Icons.event_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.entry, required this.onRemove});

  final _EducationEntry entry;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppGlassSurface(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.school_outlined, size: 18),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppPremiumTextField(
                    controller: entry.school,
                    label: 'Trường',
                    prefixIcon: Icons.account_balance_outlined,
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline_rounded, size: 18),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.degree,
              label: 'Bằng cấp',
              prefixIcon: Icons.menu_book_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.major,
              label: 'Chuyên ngành',
              prefixIcon: Icons.topic_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.gpa,
              label: 'GPA',
              prefixIcon: Icons.calculate_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.startDate,
              label: 'Từ ngày',
              prefixIcon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPremiumTextField(
              controller: entry.endDate,
              label: 'Đến ngày',
              prefixIcon: Icons.event_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryView extends StatelessWidget {
  const _SummaryView({
    required this.profile,
    required this.onEdit,
    required this.onUploadCv,
    required this.isUploading,
  });

  final CandidateProfile profile;
  final VoidCallback onEdit;
  final VoidCallback? onUploadCv;
  final bool isUploading;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      children: [
        AppGlassSurface(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.verified_user_rounded, color: scheme.primary),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Hồ sơ ứng viên',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_rounded, size: 18),
                    label: const Text('Chỉnh sửa'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _Row(label: 'Vị trí', value: profile.targetRole ?? '—'),
              _Row(label: 'Cấp độ', value: profile.targetLevel ?? '—'),
              if (profile.introduction?.isNotEmpty == true) ...[
                const SizedBox(height: AppSpacing.md),
                Text(profile.introduction!, maxLines: 6, overflow: TextOverflow.ellipsis),
              ],
              if (profile.technicalSkills.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                _WrapLabel(title: 'Kỹ năng kỹ thuật', items: profile.technicalSkills),
              ],
              if (profile.softSkills.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                _WrapLabel(title: 'Kỹ năng mềm', items: profile.softSkills),
              ],
              if (profile.tools.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                _WrapLabel(title: 'Công cụ', items: profile.tools),
              ],
              if (profile.projects.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text('Dự án', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: AppSpacing.sm),
                ...profile.projects.map((p) => _SummaryCard(
                      title: p.name ?? 'Dự án',
                      subtitle: p.description,
                      chips: p.usedTools,
                    )),
              ],
              if (profile.workExperiences.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text('Kinh nghiệm', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: AppSpacing.sm),
                ...profile.workExperiences.map((e) => _SummaryCard(
                      title: '${e.position ?? 'Vị trí'} @ ${e.company ?? ''}',
                      subtitle: _formatDateRange(e.startDate, e.endDate),
                      chips: const [],
                    )),
              ],
              if (profile.educations.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text('Học vấn', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: AppSpacing.sm),
                ...profile.educations.map((e) => _SummaryCard(
                      title: '${e.degree ?? 'Bằng cấp'} - ${e.school ?? ''}',
                      subtitle: _buildEducationSubtitle(e),
                      chips: [if (e.gpa?.isNotEmpty == true) 'GPA ${e.gpa!}'],
                    )),
              ],
            ],
          ),
        ).animate().fadeIn().slideY(begin: 0.03),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: onUploadCv,
          icon: isUploading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.upload_file_rounded),
          label: Text(isUploading ? 'Đang tải CV...' : 'Cập nhật CV (PDF)'),
        ),
      ],
    );
  }

  String _formatDateRange(String? start, String? end) {
    final parts = <String>[];
    if (start != null && start.isNotEmpty) parts.add(start);
    if (end != null && end.isNotEmpty) parts.add(end);
    if (parts.isEmpty) return '—';
    return parts.join(' - ');
  }

  String _buildEducationSubtitle(EducationEntry e) {
    final parts = <String>[];
    if (e.major?.isNotEmpty == true) parts.add(e.major!);
    if (e.startDate?.isNotEmpty == true || e.endDate?.isNotEmpty == true) {
      parts.add(_formatDateRange(e.startDate, e.endDate));
    }
    return parts.join(' • ');
  }
}

class _WrapLabel extends StatelessWidget {
  const _WrapLabel({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: items
              .map((s) => Chip(label: Text(s, style: const TextStyle(fontSize: 12))))
              .toList(),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.subtitle,
    required this.chips,
  });

  final String title;
  final String? subtitle;
  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppGlassSurface(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            if (subtitle != null && subtitle!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
            ],
            if (chips.isNotEmpty) ...[
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: chips
                    .map((c) => Chip(label: Text(c, style: const TextStyle(fontSize: 12))))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 88,
          child: Text(label, style: Theme.of(context).textTheme.bodySmall),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
