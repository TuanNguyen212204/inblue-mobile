import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/core/extensions/exception_x.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_interview_providers.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MockSessionDetailPage extends ConsumerWidget {
  const MockSessionDetailPage({required this.sessionId, super.key});

  final int sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(mockSessionDetailProvider(sessionId));

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết phiên')),
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AppErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(mockSessionDetailProvider(sessionId)),
        ),
        data: (session) => ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trạng thái: ${session.status}',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Thời gian: ${session.joinTime}'),
                    Text('Giá: ${session.totalPrice?.round() ?? 0} VND'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (session.status == 'SCHEDULED') ...[
              AppPrimaryButton(
                label: 'Thanh toán PayOS',
                onPressed: () async {
                  try {
                    final url = await ref
                        .read(mockInterviewRemoteProvider)
                        .makePayment(sessionId);
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.externalApplication);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toUserMessage())),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              OutlinedButton(
                onPressed: () async {
                  final userId = ref.read(currentUserIdProvider);
                  if (userId == null) return;
                  try {
                    await ref.read(mockInterviewRemoteProvider).transferOut(
                          amount: session.totalPrice?.round() ?? 0,
                          userId: userId,
                        );
                    await ref.read(mockInterviewRemoteProvider).updateSession({
                      'id': session.id,
                      'userId': session.userId,
                      'userId2': session.userId2,
                      'status': 'PAID',
                      'joinTime': session.joinTime,
                      'roomName': session.roomName,
                      'roomUrl': session.roomUrl,
                      'totalPrice': session.totalPrice,
                    });
                    ref.invalidate(mockSessionDetailProvider(sessionId));
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toUserMessage())),
                      );
                    }
                  }
                },
                child: const Text('Thanh toán bằng Ví'),
              ),
            ],
            if (session.canJoin(DateTime.now()))
              AppPrimaryButton(
                label: 'Vào phòng',
                onPressed: () =>
                    context.push(RoutePaths.mockInterviewRoomPath(sessionId)),
              ),
            if (session.status == 'COMPLETED') ...[
              const SizedBox(height: AppSpacing.sm),
              AppPrimaryButton(
                label: 'Viết phản hồi cho Mentor',
                onPressed: () => context.push(
                  RoutePaths.mockInterviewFeedbackPath(sessionId),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
