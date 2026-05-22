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
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_setup_notifier.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/widgets/setup_profile_step.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';

class AiInterviewSetupPage extends ConsumerWidget {
  const AiInterviewSetupPage({super.key});

  void _handleBack(BuildContext context, WidgetRef ref, int step) {
    if (step > 0) {
      ref.read(aiInterviewSetupNotifierProvider.notifier).setStep(step - 1);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setup = ref.watch(aiInterviewSetupNotifierProvider);

    return Scaffold(
      body: setup.when(
        loading: () => const AppContentSafeArea(
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => AppContentSafeArea(
          child: AppErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(aiInterviewSetupNotifierProvider),
          ),
        ),
        data: (state) => PopScope(
          canPop: state.step == 0,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            _handleBack(context, ref, state.step);
          },
          child: Column(
            children: [
            AppCompactHeader(
              title: 'Thiết lập phỏng vấn AI',
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
                  0 => _StepConfig(key: const ValueKey(0), state: state),
                  1 => const SetupProfileStep(key: ValueKey(1)),
                  _ => _StepJd(key: const ValueKey(2), state: state),
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
            ),
            ],
          ),
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
      if (!state.step2Valid) {
        _toast(
          context,
          state.isEditingProfile
              ? 'Vui lòng lưu hồ sơ trước khi tiếp tục'
              : 'Vui lòng tải CV hoặc tạo hồ sơ ứng viên',
        );
        return;
      }
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
      if (context.mounted) _toast(context, e.toString());
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
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.md),
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

class _StepConfig extends ConsumerWidget {
  const _StepConfig({required this.state, super.key});

  final AiSetupState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = state.configOptions;
    if (options == null) return const SizedBox.shrink();
    final notifier = ref.read(aiInterviewSetupNotifierProvider.notifier);

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      children: [
        AppOptionSection(
          title: 'Chế độ phỏng vấn',
          subtitle: 'Chọn hình thức AI phỏng vấn bạn muốn',
          children: _optionCards(
            options: options.interviewModes,
            selected: state.interviewMode,
            onSelect: (v) => notifier.selectConfig(interviewMode: v),
            icon: Icons.record_voice_over_outlined,
          ),
        ),
        AppOptionSection(
          title: 'Độ khó',
          subtitle: 'Mức độ câu hỏi và đánh giá',
          children: _optionCards(
            options: options.difficulties,
            selected: state.difficulty,
            onSelect: (v) => notifier.selectConfig(difficulty: v),
            icon: Icons.trending_up_rounded,
          ),
        ),
        AppOptionSection(
          title: 'Ngôn ngữ JD',
          children: _optionCards(
            options: options.languages,
            selected: state.language,
            onSelect: (v) => notifier.selectConfig(language: v),
            icon: Icons.translate_rounded,
          ),
        ),
        AppOptionSection(
          title: 'Lĩnh vực',
          children: _optionCards(
            options: options.domains,
            selected: state.domain,
            onSelect: (v) => notifier.selectConfig(domain: v),
            icon: Icons.work_outline_rounded,
          ),
        ),
        AppOptionSection(
          title: 'Thời lượng',
          subtitle: 'Thời gian tối đa cho buổi phỏng vấn',
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: AppSpacing.sm,
              crossAxisSpacing: AppSpacing.sm,
              childAspectRatio: 2.4,
              children: [15, 30, 45, 60].asMap().entries.map((entry) {
                final m = entry.value;
                final selected = state.durationMinutes == m;
                return AppSelectableOptionCard(
                  label: '$m phút',
                  selected: selected,
                  icon: Icons.timer_outlined,
                  animationIndex: entry.key,
                  onTap: () => notifier.selectConfig(durationMinutes: m),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _optionCards({
    required List<ConfigOption> options,
    required String? selected,
    required ValueChanged<String> onSelect,
    required IconData icon,
  }) {
    return options.asMap().entries.map((entry) {
      final o = entry.value;
      return AppSelectableOptionCard(
        label: o.label,
        description: o.description,
        icon: icon,
        selected: selected == o.key,
        animationIndex: entry.key,
        onTap: () => onSelect(o.key),
      );
    }).toList();
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
        Text(
          'Mô tả công việc',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          maxLines: 5,
          decoration: const InputDecoration(
            labelText: 'JD / mô tả vị trí',
            hintText: 'Nhập mô tả vị trí ứng tuyển...',
          ),
          onChanged: notifier.setJdDescription,
        ),
        const SizedBox(height: AppSpacing.md),
        AppPrimaryButton(
          label: 'Tạo JD bằng AI',
          icon: Icons.auto_awesome,
          isLoading: state.isGeneratingJd,
          onPressed: state.isGeneratingJd
              ? null
              : () async {
                  try {
                    await notifier.generateJd();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
        ),
        if (state.generatedJr != null) ...[
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Preview JD',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppGlassSurface(
            child: Text(
              state.generatedJr.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ),
        ],
      ],
    );
  }
}
