import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/tokens/app_radius.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

/// Premium selectable tile for setup wizards (interview config, duration, etc.).
class AppSelectableOptionCard extends StatelessWidget {
  const AppSelectableOptionCard({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
    this.description,
    this.icon,
    this.animationIndex = 0,
  });

  final String label;
  final String? description;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;
  final int animationIndex;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.card,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              borderRadius: AppRadius.card,
              color: selected
                  ? scheme.primary.withValues(alpha: isDark ? 0.22 : 0.1)
                  : scheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.5 : 0.85),
              border: Border.all(
                width: selected ? 1.5 : 1,
                color: selected
                    ? scheme.primary
                    : scheme.outline.withValues(alpha: 0.2),
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: scheme.primary.withValues(alpha: 0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: scheme.primary.withValues(alpha: selected ? 0.2 : 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: scheme.primary, size: 22),
                  ),
                  const SizedBox(width: AppSpacing.md),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                      ),
                      if (description != null && description!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          description!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: selected
                      ? Icon(
                          Icons.check_circle_rounded,
                          key: const ValueKey('on'),
                          color: scheme.primary,
                          size: 26,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          key: const ValueKey('off'),
                          color: scheme.onSurface.withValues(alpha: 0.25),
                          size: 26,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (60 + animationIndex * 40).ms, duration: 350.ms)
        .slideY(begin: 0.04, curve: Curves.easeOutCubic);
  }
}

/// Section title + spaced option list.
class AppOptionSection extends StatelessWidget {
  const AppOptionSection({
    required this.title,
    required this.children,
    super.key,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
          ],
          const SizedBox(height: AppSpacing.md),
          ...children,
        ],
      ),
    );
  }
}
