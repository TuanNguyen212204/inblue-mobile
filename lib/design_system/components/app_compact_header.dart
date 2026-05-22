import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

/// Slim in-content header — avoids tall SliverAppBar on mobile lists.
class AppCompactHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppCompactHeader({
    required this.title,
    super.key,
    this.subtitle,
    this.actions = const [],
    this.leading,
    this.bottom,
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(
        (subtitle != null ? 56 : 48) + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.sm,
              AppSpacing.xs,
            ),
            child: Row(
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: AppSpacing.sm)],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ).animate().fadeIn(duration: 320.ms).slideX(
                            begin: -0.04,
                            curve: Curves.easeOutCubic,
                          ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: theme.textTheme.bodySmall,
                        ).animate().fadeIn(delay: 80.ms, duration: 280.ms),
                    ],
                  ),
                ),
                ...actions,
              ],
            ),
          ),
          if (bottom != null) bottom!,
        ],
      ),
    );
  }
}
