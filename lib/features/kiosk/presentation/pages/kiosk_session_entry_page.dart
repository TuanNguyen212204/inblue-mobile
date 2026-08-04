import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:flutter_animate/flutter_animate.dart';

class KioskSessionEntryPage extends StatefulWidget {
  const KioskSessionEntryPage({super.key});

  @override
  State<KioskSessionEntryPage> createState() => _KioskSessionEntryPageState();
}

class _KioskSessionEntryPageState extends State<KioskSessionEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _sessionKeyController = TextEditingController();
  final _sessionKeyFocusNode = FocusNode();

  @override
  void dispose() {
    _sessionKeyController.dispose();
    _sessionKeyFocusNode.dispose();
    super.dispose();
  }

  void _enterInterview() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      _sessionKeyFocusNode.requestFocus();
      return;
    }

    HapticFeedback.lightImpact();
    final sessionKey = _sessionKeyController.text.trim();
    context.go(RoutePaths.aiInterviewSessionPath(sessionKey));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xl,
              AppSpacing.lg,
              AppSpacing.xl + MediaQuery.paddingOf(context).bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/inblue_kiosk_logo.jpg',
                          width: 248,
                          height: 186,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ).animate().fadeIn(duration: 350.ms).scale(
                              begin: const Offset(0.96, 0.96),
                              end: const Offset(1, 1),
                              duration: 350.ms,
                              curve: Curves.easeOutCubic,
                            ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          'Bắt đầu buổi phỏng vấn',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Nhập SessionKey được cung cấp để vào phòng phỏng vấn AI.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        TextFormField(
                          controller: _sessionKeyController,
                          focusNode: _sessionKeyFocusNode,
                          autofocus: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.go,
                          onFieldSubmitted: (_) => _enterInterview(),
                          style: textTheme.titleLarge,
                          decoration: const InputDecoration(
                            labelText: 'SessionKey',
                            hintText: 'Ví dụ: abc-123-xyz',
                            prefixIcon: Icon(Icons.key_rounded),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.lg,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Vui lòng nhập SessionKey để tiếp tục.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: FilledButton.icon(
                            onPressed: _enterInterview,
                            icon: const Icon(Icons.meeting_room_rounded),
                            label: Text(
                              'Vào phòng phỏng vấn',
                              style: textTheme.titleMedium?.copyWith(
                                color: scheme.onPrimary,
                              ),
                            ),
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: AppRadius.button,
                              ),
                            ),
                          ),
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
    );
  }
}
