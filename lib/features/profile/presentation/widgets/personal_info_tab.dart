import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_premium_text_field.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalInfoTab extends ConsumerStatefulWidget {
  const PersonalInfoTab({required this.user, super.key});

  final UserAccount user;

  @override
  ConsumerState<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends ConsumerState<PersonalInfoTab> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _universityCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _linkedinCtrl;
  late final TextEditingController _githubCtrl;

  String? _major;
  File? _pendingAvatar;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.user.name ?? '');
    _universityCtrl = TextEditingController(text: widget.user.university ?? '');
    _phoneCtrl = TextEditingController(text: widget.user.phone ?? '');
    _addressCtrl = TextEditingController(text: widget.user.address ?? '');
    _linkedinCtrl = TextEditingController(text: widget.user.linkedinUrl ?? '');
    _githubCtrl = TextEditingController(text: widget.user.githubUrl ?? '');
    _major = widget.user.major;
  }

  @override
  void didUpdateWidget(covariant PersonalInfoTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.user.id != widget.user.id) {
      _nameCtrl.text = widget.user.name ?? '';
      _universityCtrl.text = widget.user.university ?? '';
      _phoneCtrl.text = widget.user.phone ?? '';
      _addressCtrl.text = widget.user.address ?? '';
      _linkedinCtrl.text = widget.user.linkedinUrl ?? '';
      _githubCtrl.text = widget.user.githubUrl ?? '';
      _major = widget.user.major;
      _pendingAvatar = null;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _universityCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    _linkedinCtrl.dispose();
    _githubCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      imageQuality: 85,
    );
    if (picked == null) return;
    setState(() => _pendingAvatar = File(picked.path));
  }

  Future<void> _removeAvatar() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa ảnh đại diện'),
        content: const Text('Bạn có chắc muốn xóa ảnh đại diện hiện tại?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    setState(() => _pendingAvatar = null);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      final updated = widget.user.copyWith(
        name: _nameCtrl.text.trim(),
        university: _universityCtrl.text.trim(),
        phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
        address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
        linkedinUrl: _linkedinCtrl.text.trim().isEmpty ? null : _linkedinCtrl.text.trim(),
        githubUrl: _githubCtrl.text.trim().isEmpty ? null : _githubCtrl.text.trim(),
        major: _major,
      );
      final result = await ref.read(accountNotifierProvider.notifier).updatePersonal(
            user: updated,
            avatarFile: _pendingAvatar,
          );
      if (!mounted) return;
      final avatarChanged = _pendingAvatar != null ||
          widget.user.avatarUrl != result.avatarUrl;
      setState(() => _pendingAvatar = null);
      if (avatarChanged) {
        final serverAvatar = result.avatarUrl;
        if (serverAvatar == null || serverAvatar.isEmpty) {
          ProfileUiUtils.showToast(context, 'Đã xóa ảnh đại diện');
        } else if (widget.user.avatarUrl != serverAvatar) {
          ProfileUiUtils.showToast(context, 'Đã cập nhật ảnh đại diện');
        } else {
          ProfileUiUtils.showToast(context, 'Ảnh đại diện chưa thay đổi');
        }
      } else {
        ProfileUiUtils.showToast(context, 'Đã cập nhật thông tin cá nhân');
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


  Future<void> _previewCv() async {
    final cvUrl = widget.user.cvUrl;
    if (cvUrl == null || cvUrl.isEmpty) return;
    final uri = Uri.tryParse(cvUrl);
    if (uri == null || !await canLaunchUrl(uri)) {
      if (!mounted) {
        ProfileUiUtils.showToast(context, 'Không mở được CV', isError: true);
      }
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final avatarUrl = widget.user.avatarUrl;

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        children: [
          Center(
            child: GestureDetector(
              onTap: _isSaving ? null : _pickAvatar,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  AnimatedSwitcher(
                    duration: 300.ms,
                    child: _pendingAvatar != null
                        ? CircleAvatar(
                            key: const ValueKey('local'),
                            radius: 52,
                            backgroundImage: FileImage(_pendingAvatar!),
                          )
                        : CircleAvatar(
                            key: ValueKey(avatarUrl ?? 'default'),
                            radius: 52,
                            backgroundColor: scheme.primaryContainer,
                            backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty
                                ? NetworkImage(avatarUrl)
                                : null,
                            child: avatarUrl == null || avatarUrl.isEmpty
                                ? Icon(Icons.person, size: 48, color: scheme.primary)
                                : null,
                          ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ).animate().scale(begin: const Offset(0.92, 0.92)),
          if (_pendingAvatar != null)
            TextButton.icon(
              onPressed: _removeAvatar,
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              label: const Text('Xóa ảnh đã chọn'),
            ),
          const SizedBox(height: AppSpacing.xs),
          Center(
            child: Text(
              'Chạm để đổi ảnh đại diện',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPremiumTextField(
            controller: _nameCtrl,
            label: 'Họ và tên',
            prefixIcon: Icons.badge_outlined,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Vui lòng nhập họ tên';
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          AppPremiumTextField(
            controller: _universityCtrl,
            label: 'Trường / Đơn vị',
            prefixIcon: Icons.school_outlined,
          ),
          const SizedBox(height: AppSpacing.md),
          AppPremiumTextField(
            controller: _phoneCtrl,
            label: 'Số điện thoại',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: AppSpacing.md),
          AppPremiumTextField(
            controller: _addressCtrl,
            label: 'Địa chỉ',
            prefixIcon: Icons.location_on_outlined,
          ),
          const SizedBox(height: AppSpacing.md),
          AppPremiumTextField(
            controller: _linkedinCtrl,
            label: 'LinkedIn URL',
            prefixIcon: Icons.link_rounded,
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: AppSpacing.md),
          AppPremiumTextField(
            controller: _githubCtrl,
            label: 'GitHub URL',
            prefixIcon: Icons.code_rounded,
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: AppSpacing.md),
          Text('Chuyên ngành', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<String>(
            initialValue: _major != null && MajorOptions.values.contains(_major)
                ? _major
                : null,
            decoration: InputDecoration(
              hintText: 'Chọn chuyên ngành',
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: MajorOptions.values
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (v) => setState(() => _major = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          // CV Upload Section
          AppGlassSurface(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CV / Hồ sơ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tính năng tải CV đang được phát triển'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.upload_file_rounded, size: 18),
                        label: const Text('Tải lên CV'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đang phân tích CV bằng AI...'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.auto_awesome, size: 18),
                        label: const Text('Phân tích AI'),
                      ),
                    ),
                  ],
                ),
                if (widget.user.cvUrl != null && widget.user.cvUrl!.isNotEmpty) ...
                  [
                    const SizedBox(height: AppSpacing.sm),
                    TextButton.icon(
                      onPressed: _previewCv,
                      icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
                      label: const Text('Xem CV đã lưu'),
                    ),
                  ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppGlassSurface(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.lock_outline, color: scheme.primary),
              title: Text(
                'Đổi mật khẩu',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              subtitle: const Text('Cập nhật mật khẩu bảo mật tài khoản'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(RoutePaths.changePassword),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: _isSaving ? 'Đang lưu...' : 'Lưu thông tin',
            onPressed: _isSaving ? null : _save,
          ),
        ],
      ),
    );
  }
}
