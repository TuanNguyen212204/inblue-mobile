import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/practice_set.dart';

class PracticeSetDetailPage extends ConsumerWidget {
  const PracticeSetDetailPage({
    required this.practiceSetId,
    this.initialSet,
    super.key,
  });

  final int practiceSetId;
  final PracticeSet? initialSet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ps = initialSet;

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết lộ trình luyện tập')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.auto_awesome, color: Colors.amber),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          ps?.practiceSetName ??
                              'Lộ trình luyện tập #$practiceSetId',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  if (ps?.objective != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Mục tiêu: ${ps!.objective}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (ps?.totalDateNumber != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          '${ps!.totalDateNumber} ngày luyện tập',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                  if (ps?.startDate != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        const Icon(Icons.play_circle_outline, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Bắt đầu: ${ps!.startDate}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Danh sách ngày luyện tập',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...List.generate(ps?.totalDateNumber ?? 3, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: AppGlassSurface(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    child: Text('${i + 1}'),
                  ),
                  title: Text('Ngày ${i + 1}'),
                  subtitle: const Text('Ôn tập và thực hành câu hỏi'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () {},
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
