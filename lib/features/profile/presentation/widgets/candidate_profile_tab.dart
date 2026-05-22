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
      _syncFromProfile(widget.profile);
      if (widget.profile != null) _isEditing = false;
    }
  }

  void _syncFromProfile(CandidateProfile? p) {
    _roleCtrl.text = p?.targetRole ?? '';
    _levelCtrl.text = p?.targetLevel ?? '';
    _introCtrl.text = (p?.introduction ?? '').toString();
    _techCtrl.text = p?.technicalSkills.join(', ') ?? '';
    _softCtrl.text = p?.softSkills.join(', ') ?? '';
    _toolsCtrl.text = p?.tools.join(', ') ?? '';
  }

  @override
  void dispose() {
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
      projects: widget.profile?.projects ?? [],
      workExperiences: widget.profile?.workExperiences ?? [],
      educations: widget.profile?.educations ?? [],
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
        AppPrimaryButton(
          label: _isSaving ? 'Đang lưu...' : 'Lưu hồ sơ',
          onPressed: _isSaving ? null : _save,
        ),
      ],
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
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: profile.technicalSkills
                      .map((s) => Chip(label: Text(s, style: const TextStyle(fontSize: 12))))
                      .toList(),
                ),
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
