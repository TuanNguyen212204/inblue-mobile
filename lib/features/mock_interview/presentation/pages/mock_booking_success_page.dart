import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class MockBookingSuccessPage extends StatelessWidget {
  const MockBookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 96,
                color: Theme.of(context).colorScheme.primary,
              ).animate().scale(duration: 500.ms, curve: Curves.elasticOut),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Yêu cầu đã gửi!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Chờ mentor xác nhận lịch. Bạn sẽ nhận thông báo khi phiên được duyệt.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(
                label: 'Về danh sách',
                onPressed: () => context.go(RoutePaths.mockInterviewList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
