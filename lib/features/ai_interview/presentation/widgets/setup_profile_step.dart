import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_setup_notifier.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_shimmer.dart';

/// Step 2 — CV upload + candidate profile (parity web CandidateProfileStep).
class SetupProfileStep extends ConsumerStatefulWidget {
  const SetupProfileStep({super.key});

  @override
  ConsumerState<SetupProfileStep> createState() => _SetupProfileStepState();
}

class _SetupProfileStepState extends ConsumerState<SetupProfileStep> {
  final _techCtrl = TextEditingController();
  final _softCtrl = TextEditingController();
  final _toolCtrl = TextEditingController();

  @override
  void dispose() {
    _techCtrl.dispose();
    _softCtrl.dispose();
    _toolCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickCv(AiInterviewSetupNotifier notifier) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
    );
    final path = result?.files.single.path;
    if (path == null) return;
    try {
      await notifier.uploadCv(File(path));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Tải CV thành công! Kiểm tra lại thông tin và nhấn Lưu hồ sơ.',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(aiInterviewSetupNotifierProvider).requireValue;
    final notifier = ref.read(aiInterviewSetupNotifierProvider.notifier);
    final scheme = Theme.of(context).colorScheme;

    if (state.isLoadingProfile) {
      return ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        children: const [
          AppShimmerCard(height: 220),
        ],
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
        Text(
          'Hồ sơ ứng viên',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Tải CV PDF hoặc nhập thủ công — lưu hồ sơ để tiếp tục bước 3',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: scheme.onSurface.withValues(alpha: 0.7),
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (state.hasExistingProfile && !state.isEditingProfile)
          _ProfileSummaryCard(
            profile: state.existingProfile!,
            onEdit: notifier.startEditingProfile,
          )
        else if (!state.isEditingProfile)
          _NoProfileActions(
            isUploading: state.isUploadingCv,
            onUpload: () => _pickCv(notifier),
            onManual: notifier.startEditingProfile,
          )
        else
          _EditForm(
            form: state.form,
            isSaving: state.isSavingProfile,
            isUploading: state.isUploadingCv,
            hasExisting: state.hasExistingProfile,
            onUploadCv: () => _pickCv(notifier),
            onCancel: state.hasExistingProfile
                ? notifier.cancelEditingProfile
                : null,
            onSave: () async {
              try {
                await notifier.saveProfile();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đã lưu hồ sơ ứng viên thành công!'),
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              }
            },
            onChanged: notifier.updateForm,
            techCtrl: _techCtrl,
            softCtrl: _softCtrl,
            toolCtrl: _toolCtrl,
          ),
      ],
    );
  }
}

class _ProfileSummaryCard extends StatelessWidget {
  const _ProfileSummaryCard({
    required this.profile,
    required this.onEdit,
  });

  final CandidateProfile profile;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified_user_rounded, color: scheme.primary, size: 22),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Hồ sơ hiện tại',
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
          _InfoRow(label: 'Vị trí', value: profile.targetRole ?? '—'),
          const SizedBox(height: AppSpacing.sm),
          _InfoRow(label: 'Cấp độ', value: profile.targetLevel ?? '—'),
          if (profile.introduction != null && profile.introduction!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              profile.introduction!,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45),
            ),
          ],
          if (profile.technicalSkills.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            _SkillChips(skills: profile.technicalSkills),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.04);
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _NoProfileActions extends StatelessWidget {
  const _NoProfileActions({
    required this.isUploading,
    required this.onUpload,
    required this.onManual,
  });

  final bool isUploading;
  final VoidCallback onUpload;
  final VoidCallback onManual;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (isUploading) {
      return AppGlassSurface(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        child: Column(
          children: [
            CircularProgressIndicator(color: scheme.primary),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Đang phân tích CV...',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'AI đang trích xuất thông tin từ PDF',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ActionTile(
                icon: Icons.upload_file_rounded,
                title: 'Tải CV lên',
                subtitle: 'PDF — tự động điền',
                accent: scheme.primary,
                onTap: onUpload,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _ActionTile(
                icon: Icons.edit_note_rounded,
                title: 'Nhập thủ công',
                subtitle: 'Điền form chi tiết',
                accent: scheme.secondary,
                onTap: onManual,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        AppGlassSurface(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline_rounded, color: scheme.primary, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Bạn chưa có hồ sơ. Tải CV hoặc nhập thủ công, sau đó nhấn Lưu hồ sơ để tiếp tục.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.4),
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.card,
        child: AppGlassSurface(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, size: 28, color: accent),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditForm extends StatefulWidget {
  const _EditForm({
    required this.form,
    required this.isSaving,
    required this.isUploading,
    required this.hasExisting,
    required this.onUploadCv,
    required this.onSave,
    required this.onChanged,
    this.onCancel,
    required this.techCtrl,
    required this.softCtrl,
    required this.toolCtrl,
  });

  final CandidateProfileForm form;
  final bool isSaving;
  final bool isUploading;
  final bool hasExisting;
  final VoidCallback onUploadCv;
  final VoidCallback? onCancel;
  final VoidCallback onSave;
  final ValueChanged<CandidateProfileForm> onChanged;
  final TextEditingController techCtrl;
  final TextEditingController softCtrl;
  final TextEditingController toolCtrl;

  @override
  State<_EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<_EditForm> {
  late final _roleCtrl = TextEditingController(text: widget.form.targetRole);
  late final _levelCtrl = TextEditingController(text: widget.form.targetLevel);
  late final _introCtrl = TextEditingController(text: widget.form.introduction);

  @override
  void dispose() {
    _roleCtrl.dispose();
    _levelCtrl.dispose();
    _introCtrl.dispose();
    super.dispose();
  }

  void _emit() {
    widget.onChanged(
      widget.form.copyWith(
        targetRole: _roleCtrl.text,
        targetLevel: _levelCtrl.text,
        introduction: _introCtrl.text,
      ),
    );
  }

  void _addSkill(
    TextEditingController ctrl,
    List<String> list,
    void Function(List<String>) update,
  ) {
    final v = ctrl.text.trim();
    if (v.isEmpty) return;
    if (list.any((s) => s.toLowerCase() == v.toLowerCase())) return;
    update([...list, v]);
    ctrl.clear();
    _emit();
  }

  @override
  Widget build(BuildContext context) {
    final f = widget.form;
    final scheme = Theme.of(context).colorScheme;

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton.icon(
            onPressed: widget.isUploading ? null : widget.onUploadCv,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: BorderSide(color: scheme.primary.withValues(alpha: 0.5)),
            ),
            icon: widget.isUploading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: scheme.primary,
                    ),
                  )
                : Icon(Icons.upload_file_rounded, color: scheme.primary),
            label: const Text('Tải CV PDF để tự điền'),
          ),
          const SizedBox(height: AppSpacing.lg),
          _FormField(
            controller: _roleCtrl,
            label: 'Vị trí mục tiêu *',
            hint: 'VD: Flutter Developer',
            onChanged: (_) => _emit(),
          ),
          const SizedBox(height: AppSpacing.md),
          _FormField(
            controller: _levelCtrl,
            label: 'Cấp độ',
            hint: 'Intern, Fresher, Junior...',
            onChanged: (_) => _emit(),
          ),
          const SizedBox(height: AppSpacing.md),
          _FormField(
            controller: _introCtrl,
            label: 'Giới thiệu bản thân *',
            maxLines: 4,
            onChanged: (_) => _emit(),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SkillEditor(
            label: 'Kỹ năng kỹ thuật',
            chips: f.technicalSkills,
            controller: widget.techCtrl,
            onAdd: () => _addSkill(
              widget.techCtrl,
              f.technicalSkills,
              (list) => widget.onChanged(f.copyWith(technicalSkills: list)),
            ),
            onRemove: (i) {
              final list = [...f.technicalSkills]..removeAt(i);
              widget.onChanged(f.copyWith(technicalSkills: list));
              _emit();
            },
          ),
          _SkillEditor(
            label: 'Kỹ năng mềm',
            chips: f.softSkills,
            controller: widget.softCtrl,
            onAdd: () => _addSkill(
              widget.softCtrl,
              f.softSkills,
              (list) => widget.onChanged(f.copyWith(softSkills: list)),
            ),
            onRemove: (i) {
              final list = [...f.softSkills]..removeAt(i);
              widget.onChanged(f.copyWith(softSkills: list));
              _emit();
            },
          ),
          _SkillEditor(
            label: 'Công cụ',
            chips: f.tools,
            controller: widget.toolCtrl,
            onAdd: () => _addSkill(
              widget.toolCtrl,
              f.tools,
              (list) => widget.onChanged(f.copyWith(tools: list)),
            ),
            onRemove: (i) {
              final list = [...f.tools]..removeAt(i);
              widget.onChanged(f.copyWith(tools: list));
              _emit();
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              if (widget.onCancel != null)
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.isSaving ? null : widget.onCancel,
                    child: const Text('Hủy'),
                  ),
                ),
              if (widget.onCancel != null) const SizedBox(width: AppSpacing.sm),
              Expanded(
                flex: 2,
                child: AppPrimaryButton(
                  label: 'Lưu hồ sơ',
                  icon: Icons.save_rounded,
                  isLoading: widget.isSaving,
                  onPressed: f.canSave && !widget.isSaving ? widget.onSave : null,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 350.ms);
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.label,
    this.hint,
    this.maxLines = 1,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final int maxLines;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(borderRadius: AppRadius.button),
      ),
    );
  }
}

class _SkillEditor extends StatelessWidget {
  const _SkillEditor({
    required this.label,
    required this.chips,
    required this.controller,
    required this.onAdd,
    required this.onRemove,
  });

  final String label;
  final List<String> chips;
  final TextEditingController controller;
  final VoidCallback onAdd;
  final void Function(int index) onRemove;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (chips.isNotEmpty)
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (var i = 0; i < chips.length; i++)
                  Chip(
                    label: Text(chips[i]),
                    deleteIcon: const Icon(Icons.close_rounded, size: 16),
                    onDeleted: () => onRemove(i),
                    backgroundColor: scheme.primary.withValues(alpha: 0.1),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
              ],
            ),
          if (chips.isNotEmpty) const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Nhập kỹ năng, nhấn Thêm',
                    isDense: true,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.md,
                    ),
                    border: OutlineInputBorder(borderRadius: AppRadius.button),
                  ),
                  onSubmitted: (_) => onAdd(),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              FilledButton.tonal(
                onPressed: onAdd,
                child: const Text('Thêm'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillChips extends StatelessWidget {
  const _SkillChips({required this.skills});

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: skills
          .map(
            (s) => Chip(
              label: Text(s),
              backgroundColor: scheme.primary.withValues(alpha: 0.1),
              side: BorderSide.none,
            ),
          )
          .toList(),
    );
  }
}
