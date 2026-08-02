import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_compact_header.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/components/app_selectable_option_card.dart';
import 'package:inblue_mobile/design_system/layout/app_content_safe_area.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/core/extensions/exception_x.dart';
import 'package:inblue_mobile/features/mock_interview/domain/entities/mentor.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_schedule_notifier.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:intl/intl.dart';

class MockSchedulePage extends ConsumerWidget {
  const MockSchedulePage({super.key});

  void _handleBack(BuildContext context, WidgetRef ref, int step) {
    if (step > 0) {
      ref.read(mockScheduleNotifierProvider.notifier).setStep(step - 1);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(mockScheduleNotifierProvider);

    return schedule.when(
      loading: () => const Scaffold(
        body: AppContentSafeArea(
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, _) => Scaffold(
        body: AppContentSafeArea(
          child: AppErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(mockScheduleNotifierProvider),
          ),
        ),
      ),
      data: (state) => PopScope(
        canPop: state.step == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          _handleBack(context, ref, state.step);
        },
        child: Scaffold(
          body: Column(
            children: [
              AppCompactHeader(
                title: 'Đặt lịch Mock Interview',
                subtitle: 'Bước ${state.step + 1} / 3',
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => _handleBack(context, ref, state.step),
                ),
              ),
              _StepIndicator(current: state.step),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 320),
                  child: switch (state.step) {
                    0 => _MentorStep(
                        key: const ValueKey(0),
                        state: state,
                      ),
                    1 => _TimeStep(
                        key: const ValueKey(1),
                        state: state,
                      ),
                    _ => _ConfirmStep(
                        key: const ValueKey(2),
                        state: state,
                      ),
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.sm,
                    AppSpacing.md,
                    AppSpacing.md,
                  ),
                  child: Row(
                    children: [
                      if (state.step > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => ref
                                .read(mockScheduleNotifierProvider.notifier)
                                .setStep(state.step - 1),
                            child: const Text('Quay lại'),
                          ),
                        ),
                      if (state.step > 0) const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        flex: 2,
                        child: AppPrimaryButton(
                          label: state.step < 2 ? 'Tiếp tục' : 'Xác nhận đặt lịch',
                          isLoading: state.isSubmitting,
                          onPressed: () => _next(context, ref, state),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _next(
    BuildContext context,
    WidgetRef ref,
    MockScheduleState state,
  ) async {
    final notifier = ref.read(mockScheduleNotifierProvider.notifier);
    if (state.step == 0) {
      if (state.selectedMentor == null) {
        _snack(context, 'Chọn mentor');
        return;
      }
      notifier.setStep(1);
      return;
    }
    if (state.step == 1) {
      if (state.joinTime == null) {
        _snack(context, 'Chọn thời gian');
        return;
      }
      if (state.joinTime!.isBefore(DateTime.now().add(const Duration(minutes: 1)))) {
        _snack(context, 'Thời gian phải sau hiện tại ít nhất 1 phút');
        return;
      }
      notifier.setStep(2);
      return;
    }
    try {
      final id = await notifier.submit();
      if (context.mounted) {
        context.go(RoutePaths.mockInterviewBookingSuccess);
        if (id != null) {
          context.push(RoutePaths.mockInterviewHistoryPath(id));
        }
      }
    } catch (e) {
      if (context.mounted) _snack(context, e.toUserMessage());
    }
  }

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.current});

  final int current;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.md,
      ),
      child: Row(
        children: List.generate(3, (i) {
          final active = i <= current;
          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(right: i < 2 ? 8 : 0),
              decoration: BoxDecoration(
                color: active
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ).animate().fadeIn(delay: (i * 80).ms);
        }),
      ),
    );
  }
}

class _MentorStep extends ConsumerWidget {
  const _MentorStep({required this.state, super.key});

  final MockScheduleState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mockScheduleNotifierProvider.notifier);
    final mentors = state.filteredMentors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              hintText: 'Tìm mentor theo tên hoặc chuyên môn...',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: notifier.setSearch,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Expanded(
          child: mentors.isEmpty
              ? Center(
                  child: Text(
                    'Không tìm thấy mentor phù hợp',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    0,
                    AppSpacing.md,
                    AppSpacing.lg,
                  ),
                  children: [
                    Text(
                      'Chọn mentor',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${mentors.length} mentor khả dụng',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ...mentors.asMap().entries.map((entry) {
                      final m = entry.value;
                      return _mentorCard(
                        context,
                        m,
                        selected: state.selectedMentor?.id == m.id,
                        index: entry.key,
                        onTap: () => notifier.selectMentor(m),
                      );
                    }),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _mentorCard(
    BuildContext context,
    Mentor m, {
    required bool selected,
    required int index,
    required VoidCallback onTap,
  }) {
    final price = m.pricePerMinute ?? 0;
    final rating = m.averageRating;
    final desc = [
      if (m.expertise != null && m.expertise!.isNotEmpty) m.expertise,
      if (price > 0) '${price.round()}đ/phút',
      if (rating != null) '★ ${rating.toStringAsFixed(1)}',
    ].whereType<String>().join(' · ');

    return AppSelectableOptionCard(
      label: m.name ?? 'Mentor',
      description: desc.isEmpty ? null : desc,
      icon: Icons.person_search_rounded,
      selected: selected,
      animationIndex: index,
      onTap: onTap,
    );
  }
}

class _TimeStep extends ConsumerWidget {
  const _TimeStep({required this.state, super.key});

  final MockScheduleState state;

  static const _durations = [30, 45, 60, 90];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mockScheduleNotifierProvider.notifier);
    final dateFmt = DateFormat('dd/MM/yyyy · HH:mm');

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      children: [
        AppOptionSection(
          title: 'Thời gian phỏng vấn',
          subtitle: 'Chọn ngày và giờ bắt đầu',
          children: [
            AppSelectableOptionCard(
              label: state.joinTime != null
                  ? dateFmt.format(state.joinTime!.toLocal())
                  : 'Chọn ngày giờ',
              description: state.joinTime != null
                  ? 'Nhấn để đổi lịch'
                  : 'Tối thiểu 1 phút sau thời điểm hiện tại',
              icon: Icons.event_available_rounded,
              selected: state.joinTime != null,
              onTap: () => _pickDateTime(context, notifier),
            ),
          ],
        ),
        AppOptionSection(
          title: 'Thời lượng',
          subtitle: 'Số phút cho buổi phỏng vấn',
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: AppSpacing.sm,
              crossAxisSpacing: AppSpacing.sm,
              childAspectRatio: 2.4,
              children: _durations.asMap().entries.map((entry) {
                final minutes = entry.value;
                return AppSelectableOptionCard(
                  label: '$minutes phút',
                  icon: Icons.timer_outlined,
                  selected: state.durationMinutes == minutes,
                  animationIndex: entry.key,
                  onTap: () => notifier.setDuration(minutes),
                );
              }).toList(),
            ),
          ],
        ),
        if (state.selectedMentor != null) ...[
          const SizedBox(height: AppSpacing.sm),
          AppGlassSurface(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Icon(
                  Icons.payments_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Ước tính: ${state.totalPrice.round()}đ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _pickDateTime(
    BuildContext context,
    MockScheduleNotifier notifier,
  ) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      initialDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 0),
    );
    if (time == null) return;
    notifier.setJoinTime(
      DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      ),
    );
  }
}

class _ConfirmStep extends StatelessWidget {
  const _ConfirmStep({required this.state, super.key});

  final MockScheduleState state;

  @override
  Widget build(BuildContext context) {
    final m = state.selectedMentor;
    final dateFmt = DateFormat('dd/MM/yyyy HH:mm');

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text(
          'Xác nhận đặt lịch',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppGlassSurface(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ConfirmRow(
                icon: Icons.person_outline,
                label: 'Mentor',
                value: m?.name ?? '—',
              ),
              const SizedBox(height: AppSpacing.md),
              _ConfirmRow(
                icon: Icons.schedule_rounded,
                label: 'Thời gian',
                value: state.joinTime != null
                    ? dateFmt.format(state.joinTime!.toLocal())
                    : '—',
              ),
              const SizedBox(height: AppSpacing.md),
              _ConfirmRow(
                icon: Icons.timelapse_rounded,
                label: 'Thời lượng',
                value: '${state.durationMinutes} phút',
              ),
              const Divider(height: AppSpacing.lg),
              Text(
                'Tổng thanh toán',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '${state.totalPrice.round()} VND',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.04),
      ],
    );
  }
}

class _ConfirmRow extends StatelessWidget {
  const _ConfirmRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
