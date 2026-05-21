import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/config/app_config.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingPhone),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                AppConfig.appName,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sectionGap),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpacing.md),
              const TextField(
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppPrimaryButton(
                label: 'Đăng nhập',
                onPressed: () {
                  // TODO: wire LoginUseCase + auth notifier
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
