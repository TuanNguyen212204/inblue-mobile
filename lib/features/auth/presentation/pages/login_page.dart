import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/config/app_config.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_gradient_mesh_background.dart';
import 'package:inblue_mobile/design_system/components/app_premium_text_field.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    HapticFeedback.lightImpact();
    await ref.read(authNotifierProvider.notifier).login(
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
        );
    if (!mounted) return;
    final err = ref.read(authNotifierProvider).error;
    if (err != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
      return;
    }
    // Navigation handled by GoRouter redirect after auth state updates.
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    final isLoading = auth.isLoading;
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AppGradientMeshBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPaddingPhone,
              vertical: AppSpacing.lg,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height -
                    MediaQuery.paddingOf(context).vertical -
                    AppSpacing.lg * 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  const SizedBox(height: AppSpacing.xl),
                  _BrandHeader(scheme: scheme, isDark: isDark),
                  const SizedBox(height: AppSpacing.sectionGap),
                  AppGlassSurface(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Đăng nhập',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            'Tiếp tục hành trình phỏng vấn của bạn',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          AppPremiumTextField(
                            controller: _emailCtrl,
                            label: 'Email',
                            prefixIcon: Icons.alternate_email_rounded,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            animationIndex: 0,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Vui lòng nhập email' : null,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          AppPremiumTextField(
                            controller: _passwordCtrl,
                            label: 'Mật khẩu',
                            prefixIcon: Icons.lock_outline_rounded,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            autofillHints: const [AutofillHints.password],
                            animationIndex: 1,
                            onFieldSubmitted: (_) => _submit(),
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Vui lòng nhập mật khẩu' : null,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          AppPrimaryButton(
                            label: 'Đăng nhập',
                            icon: Icons.arrow_forward_rounded,
                            isLoading: isLoading,
                            onPressed: isLoading ? null : _submit,
                          ).animate().fadeIn(delay: 320.ms).scale(
                                begin: const Offset(0.96, 0.96),
                                curve: Curves.easeOutBack,
                              ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(duration: 500.ms).slideY(
                        begin: 0.05,
                        curve: Curves.easeOutCubic,
                      ),
                    ],
                  ),
                  Text(
                    '© ${DateTime.now().year} ${AppConfig.appName}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ).animate().fadeIn(delay: 480.ms),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader({required this.scheme, required this.isDark});

  final ColorScheme scheme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'inblue-brand-mark',
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  scheme.primary,
                  isDark ? AppColors.meshAccentDark : AppColors.brightBlue,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: scheme.primary.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.waves_rounded, color: Colors.white, size: 36),
          ),
        ).animate().scale(
              begin: const Offset(0.85, 0.85),
              duration: 600.ms,
              curve: Curves.easeOutBack,
            ),
        const SizedBox(height: AppSpacing.md),
        Text(
          AppConfig.appName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.08),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Phỏng vấn thông minh cho ứng viên',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.75),
              ),
        ).animate().fadeIn(delay: 120.ms, duration: 400.ms),
      ],
    );
  }
}
