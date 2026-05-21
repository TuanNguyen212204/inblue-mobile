import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
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

    if (state.isLoadingProfile) {
      return const Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: AppShimmerCard(height: 200),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Hồ sơ hiện tại',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Chỉnh sửa'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text('Vị trí: ${profile.targetRole ?? '—'}'),
            Text('Cấp độ: ${profile.targetLevel ?? '—'}'),
            if (profile.introduction != null && profile.introduction!.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                profile.introduction!,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (profile.technicalSkills.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: profile.technicalSkills
                    .map((s) => Chip(label: Text(s), visualDensity: VisualDensity.compact))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
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
    if (isUploading) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                Text('Đang phân tích CV...'),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ActionTile(
                icon: Icons.upload_file,
                title: 'Tải CV lên',
                subtitle: 'PDF — tự động điền',
                color: Colors.teal,
                onTap: onUpload,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _ActionTile(
                icon: Icons.edit_note,
                title: 'Nhập thủ công',
                subtitle: 'Tự điền form',
                color: Colors.deepPurple,
                onTap: onManual,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          color: Theme.of(context).colorScheme.tertiaryContainer.withValues(alpha: 0.3),
          child: const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Text(
              'Bạn chưa có hồ sơ. Tải CV hoặc nhập thủ công, sau đó nhấn Lưu hồ sơ để tiếp tục.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton.icon(
          onPressed: widget.isUploading ? null : widget.onUploadCv,
          icon: widget.isUploading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.upload_file),
          label: const Text('Tải CV PDF để tự điền'),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          controller: _roleCtrl,
          decoration: const InputDecoration(
            labelText: 'Vị trí mục tiêu *',
            hintText: 'VD: Flutter Developer',
          ),
          onChanged: (_) => _emit(),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: _levelCtrl,
          decoration: const InputDecoration(
            labelText: 'Cấp độ',
            hintText: 'Intern, Fresher, Junior...',
          ),
          onChanged: (_) => _emit(),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: _introCtrl,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Giới thiệu bản thân *',
          ),
          onChanged: (_) => _emit(),
        ),
        const SizedBox(height: AppSpacing.md),
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
                isLoading: widget.isSaving,
                onPressed: f.canSave && !widget.isSaving ? widget.onSave : null,
              ),
            ),
          ],
        ),
      ],
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
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (var i = 0; i < chips.length; i++)
                InputChip(
                  label: Text(chips[i]),
                  onDeleted: () => onRemove(i),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Nhập và nhấn Thêm',
                    isDense: true,
                  ),
                  onSubmitted: (_) => onAdd(),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(onPressed: onAdd, child: const Text('Thêm')),
            ],
          ),
        ],
      ),
    );
  }
}
