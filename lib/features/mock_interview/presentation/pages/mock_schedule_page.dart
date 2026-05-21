import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_schedule_notifier.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';

class MockSchedulePage extends ConsumerWidget {
  const MockSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(mockScheduleNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Đặt lịch Mock Interview')),
      body: schedule.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AppErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(mockScheduleNotifierProvider),
        ),
        data: (state) => Column(
          children: [
            _StepBar(step: state.step),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: switch (state.step) {
                  0 => _MentorStep(state: state),
                  1 => _TimeStep(state: state),
                  _ => _ConfirmStep(state: state),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: AppPrimaryButton(
                label: state.step < 2 ? 'Tiếp tục' : 'Xác nhận đặt lịch',
                isLoading: state.isSubmitting,
                onPressed: () => _next(context, ref, state),
              ),
            ),
          ],
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
      _snack(context, e.toString());
    }
  }

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _StepBar extends StatelessWidget {
  const _StepBar({required this.step});
  final int step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: ['Mentor', 'Thời gian', 'Xác nhận'].asMap().entries.map((e) {
          final active = e.key <= step;
          return Expanded(
            child: Text(
              e.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                color: active
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).disabledColor,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _MentorStep extends ConsumerWidget {
  const _MentorStep({required this.state});
  final MockScheduleState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mockScheduleNotifierProvider.notifier);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Tìm mentor...',
            ),
            onChanged: notifier.setSearch,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: state.filteredMentors.length,
            itemBuilder: (_, i) {
              final m = state.filteredMentors[i];
              final selected = state.selectedMentor?.id == m.id;
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: m.avatarUrl != null
                        ? NetworkImage(m.avatarUrl!)
                        : null,
                    child: m.avatarUrl == null ? const Icon(Icons.person) : null,
                  ),
                  title: Text(m.name ?? 'Mentor'),
                  subtitle: Text(
                    '${m.expertise ?? ''} · ${m.pricePerMinute ?? 0}đ/phút',
                  ),
                  trailing: selected
                      ? Icon(Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () => notifier.selectMentor(m),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TimeStep extends ConsumerWidget {
  const _TimeStep({required this.state});
  final MockScheduleState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mockScheduleNotifierProvider.notifier);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        ListTile(
          title: const Text('Ngày giờ phỏng vấn'),
          subtitle: Text(state.joinTime?.toString() ?? 'Chưa chọn'),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
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
            notifier.setJoinTime(DateTime(
              date.year,
              date.month,
              date.day,
              time.hour,
              time.minute,
            ));
          },
        ),
        const SizedBox(height: AppSpacing.md),
        Text('Thời lượng (phút)', style: Theme.of(context).textTheme.titleMedium),
        Slider(
          value: state.durationMinutes.toDouble(),
          min: 30,
          max: 120,
          divisions: 3,
          label: '${state.durationMinutes}',
          onChanged: (v) => notifier.setDuration(v.round()),
        ),
      ],
    );
  }
}

class _ConfirmStep extends StatelessWidget {
  const _ConfirmStep({required this.state});
  final MockScheduleState state;

  @override
  Widget build(BuildContext context) {
    final m = state.selectedMentor;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mentor: ${m?.name ?? ''}',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('Thời gian: ${state.joinTime}'),
              Text('Thời lượng: ${state.durationMinutes} phút'),
              const Divider(height: 24),
              Text(
                'Tổng: ${state.totalPrice.round()} VND',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
