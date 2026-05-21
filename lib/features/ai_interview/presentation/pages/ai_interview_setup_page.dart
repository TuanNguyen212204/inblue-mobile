import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_setup_notifier.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';

class AiInterviewSetupPage extends ConsumerWidget {
  const AiInterviewSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setup = ref.watch(aiInterviewSetupNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Thiết lập phỏng vấn AI')),
      body: setup.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AppErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(aiInterviewSetupNotifierProvider),
        ),
        data: (state) => Column(
          children: [
            _StepIndicator(current: state.step),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 320),
                child: switch (state.step) {
                  0 => _StepConfig(key: const ValueKey(0), state: state),
                  1 => _StepProfile(key: const ValueKey(1)),
                  _ => _StepJd(key: const ValueKey(2), state: state),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  if (state.step > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => ref
                            .read(aiInterviewSetupNotifierProvider.notifier)
                            .setStep(state.step - 1),
                        child: const Text('Quay lại'),
                      ),
                    ),
                  if (state.step > 0) const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    flex: 2,
                    child: AppPrimaryButton(
                      label: state.step < 2 ? 'Tiếp tục' : 'Bắt đầu phỏng vấn',
                      isLoading: state.isCreating,
                      onPressed: () => _onNext(context, ref, state),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onNext(
    BuildContext context,
    WidgetRef ref,
    AiSetupState state,
  ) async {
    final notifier = ref.read(aiInterviewSetupNotifierProvider.notifier);
    if (state.step == 0) {
      if (!state.step1Valid) {
        _toast(context, 'Vui lòng chọn đủ cấu hình');
        return;
      }
      notifier.setStep(1);
      return;
    }
    if (state.step == 1) {
      notifier.setStep(2);
      return;
    }
    if (!state.step3Valid) {
      _toast(context, 'Vui lòng tạo JD bằng AI');
      return;
    }
    try {
      final sessionKey = await notifier.createSession();
      if (context.mounted) {
        context.go(RoutePaths.aiInterviewSessionPath(sessionKey));
      }
    } catch (e) {
      _toast(context, e.toString());
    }
  }

  void _toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.current});

  final int current;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
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
          );
        }),
      ),
    );
  }
}

class _StepConfig extends ConsumerWidget {
  const _StepConfig({required this.state, super.key});

  final AiSetupState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = state.configOptions;
    if (options == null) return const SizedBox.shrink();
    final notifier = ref.read(aiInterviewSetupNotifierProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        _OptionSection(
          title: 'Chế độ phỏng vấn',
          options: options.interviewModes,
          selected: state.interviewMode,
          onSelect: (v) => notifier.selectConfig(interviewMode: v),
        ),
        _OptionSection(
          title: 'Độ khó',
          options: options.difficulties,
          selected: state.difficulty,
          onSelect: (v) => notifier.selectConfig(difficulty: v),
        ),
        _OptionSection(
          title: 'Ngôn ngữ JD',
          options: options.languages,
          selected: state.language,
          onSelect: (v) => notifier.selectConfig(language: v),
        ),
        _OptionSection(
          title: 'Lĩnh vực',
          options: options.domains,
          selected: state.domain,
          onSelect: (v) => notifier.selectConfig(domain: v),
        ),
        const Text('Thời lượng'),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: 8,
          children: [15, 30, 45, 60].map((m) {
            final selected = state.durationMinutes == m;
            return ChoiceChip(
              label: Text('$m phút'),
              selected: selected,
              onSelected: (_) => notifier.selectConfig(durationMinutes: m),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _OptionSection extends StatelessWidget {
  const _OptionSection({
    required this.title,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  final String title;
  final List<ConfigOption> options;
  final String? selected;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        ...options.map(
          (o) => Card(
            child: ListTile(
              title: Text(o.label),
              subtitle: o.description != null ? Text(o.description!) : null,
              trailing: selected == o.key
                  ? Icon(Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary)
                  : null,
              onTap: () => onSelect(o.key),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}

class _StepProfile extends StatelessWidget {
  const _StepProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hồ sơ ứng viên'),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Upload CV PDF và hoàn thiện profile trên bước tiếp theo. '
            'Tạm thời dùng profile mặc định để bắt đầu phỏng vấn.',
          ),
        ],
      ),
    );
  }
}

class _StepJd extends ConsumerWidget {
  const _StepJd({required this.state, super.key});

  final AiSetupState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(aiInterviewSetupNotifierProvider.notifier);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        TextField(
          maxLines: 5,
          decoration: const InputDecoration(
            labelText: 'Mô tả công việc / JD',
            hintText: 'Nhập mô tả vị trí ứng tuyển...',
          ),
          onChanged: notifier.setJdDescription,
        ),
        const SizedBox(height: AppSpacing.md),
        AppPrimaryButton(
          label: 'Tạo JD bằng AI',
          isLoading: state.isGeneratingJd,
          onPressed: state.isGeneratingJd
              ? null
              : () async {
                  try {
                    await notifier.generateJd();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                },
        ),
        if (state.generatedJr != null) ...[
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Preview JD',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(state.generatedJr.toString()),
            ),
          ),
        ],
      ],
    );
  }
}
