import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_premium_text_field.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/account_notifier.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPwdCtrl = TextEditingController();
  final _newPwdCtrl = TextEditingController();
  final _confirmPwdCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPwdCtrl.dispose();
    _newPwdCtrl.dispose();
    _confirmPwdCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_newPwdCtrl.text != _confirmPwdCtrl.text) {
      ProfileUiUtils.showToast(context, 'Xác nhận mật khẩu mới không khớp', isError: true);
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref.read(accountNotifierProvider.notifier).changePassword(
            currentPassword: _currentPwdCtrl.text,
            newPassword: _newPwdCtrl.text,
          );
      if (!mounted) return;
      ProfileUiUtils.showToast(context, 'Đã đổi mật khẩu thành công');
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      ProfileUiUtils.showToast(
        context,
        ProfileUiUtils.stripExceptionPrefix(e),
        isError: true,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đổi mật khẩu')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: AppGlassSurface(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cập nhật mật khẩu tài khoản',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppSpacing.md),
                AppPremiumTextField(
                  controller: _currentPwdCtrl,
                  label: 'Mật khẩu hiện tại',
                  obscureText: true,
                  prefixIcon: Icons.key_outlined,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Vui lòng nhập mật khẩu hiện tại' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                AppPremiumTextField(
                  controller: _newPwdCtrl,
                  label: 'Mật khẩu mới (tối thiểu 6 ký tự)',
                  obscureText: true,
                  prefixIcon: Icons.lock_reset_outlined,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Vui lòng nhập mật khẩu mới';
                    if (v.length < 6) return 'Mật khẩu phải từ 6 ký tự trở lên';
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                AppPremiumTextField(
                  controller: _confirmPwdCtrl,
                  label: 'Xác nhận mật khẩu mới',
                  obscureText: true,
                  prefixIcon: Icons.verified_user_outlined,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Vui lòng xác nhận mật khẩu';
                    if (v != _newPwdCtrl.text) return 'Xác nhận mật khẩu không khớp';
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.xl),
                AppPrimaryButton(
                  label: _isLoading ? 'Đang lưu...' : 'Lưu mật khẩu mới',
                  isLoading: _isLoading,
                  onPressed: _isLoading ? null : _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
