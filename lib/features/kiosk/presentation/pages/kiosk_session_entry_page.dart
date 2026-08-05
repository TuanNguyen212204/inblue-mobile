import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_gradient_mesh_background.dart';
import 'package:inblue_mobile/design_system/components/app_premium_text_field.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/components/app_status_badge.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class KioskSessionEntryPage extends StatefulWidget {
  const KioskSessionEntryPage({super.key});

  @override
  State<KioskSessionEntryPage> createState() => _KioskSessionEntryPageState();
}

class _KioskSessionEntryPageState extends State<KioskSessionEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _sessionKeyController = TextEditingController();
  final _sessionKeyFocusNode = FocusNode();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _sessionKeyController.dispose();
    _sessionKeyFocusNode.dispose();
    super.dispose();
  }

  Future<void> _enterInterview() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      _sessionKeyFocusNode.requestFocus();
      return;
    }

    HapticFeedback.mediumImpact();
    setState(() => _isSubmitting = true);

    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    final sessionKey = _sessionKeyController.text.trim();
    context.go(RoutePaths.aiInterviewSessionPath(sessionKey));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: AppGradientMeshBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xl,
                AppSpacing.lg,
                AppSpacing.xl + MediaQuery.paddingOf(context).bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 48),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 460),
                    child: AppGlassSurface(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xl,
                        vertical: AppSpacing.xxl,
                      ),
                      borderRadius: BorderRadius.circular(32),
                      blur: 16,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ── Top Badge Tag ────────────────────────────────────────
                            AppStatusBadge(
                              label: 'CỔNG KIOSK · PHỎNG VẤN AI',
                              backgroundColor: scheme.primary.withValues(alpha: 0.15),
                              foregroundColor: scheme.primary,
                            ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1),

                            const SizedBox(height: AppSpacing.lg),

                            // ── Brand Logo Header ─────────────────────────────────────
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/inblue_kiosk_logo.jpg',
                                width: 220,
                                height: 165,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ).animate().fadeIn(duration: 450.ms).scale(
                                  begin: const Offset(0.95, 0.95),
                                  duration: 450.ms,
                                  curve: Curves.easeOutCubic,
                                ),

                            const SizedBox(height: AppSpacing.xl),

                            // ── Title & Subtitle ─────────────────────────────────────
                            Text(
                              'Bắt đầu buổi phỏng vấn',
                              textAlign: TextAlign.center,
                              style: textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.3,
                              ),
                            ).animate().fadeIn(delay: 150.ms, duration: 400.ms),

                            const SizedBox(height: AppSpacing.xs),

                            Text(
                              'Nhập SessionKey được cung cấp để kết nối trực tiếp tới phòng phỏng vấn AI.',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium?.copyWith(
                                color: scheme.onSurface.withValues(alpha: 0.7),
                                height: 1.45,
                              ),
                            ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

                            const SizedBox(height: AppSpacing.xxl),

                            // ── SessionKey Field ─────────────────────────────────────
                            AppPremiumTextField(
                              controller: _sessionKeyController,
                              label: 'SessionKey phỏng vấn',
                              hint: 'Ví dụ: abc-123-xyz',
                              prefixIcon: Icons.key_rounded,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              onFieldSubmitted: (_) => _enterInterview(),
                              animationIndex: 1,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Vui lòng nhập SessionKey để tiếp tục.';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: AppSpacing.xl),

                            // ── Submit Button ────────────────────────────────────────
                            AppPrimaryButton(
                              label: 'Vào phòng phỏng vấn',
                              icon: Icons.meeting_room_rounded,
                              isLoading: _isSubmitting,
                              onPressed: _enterInterview,
                            ).animate().fadeIn(delay: 300.ms, duration: 400.ms),

                            const SizedBox(height: AppSpacing.md),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shield_outlined,
                                  size: 14,
                                  color: scheme.onSurface.withValues(alpha: 0.45),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Bảo mật dữ liệu bằng AI Engine v3',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: scheme.onSurface.withValues(alpha: 0.45),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
