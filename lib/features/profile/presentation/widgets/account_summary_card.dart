import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inblue_mobile/design_system/components/app_glass_surface.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/presentation/utils/profile_ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountSummaryCard extends StatelessWidget {
  const AccountSummaryCard({
    required this.user,
    required this.onPreviewCv,
    required this.onRemoveAvatar,
    required this.planLabel,
    super.key,
  });

  final UserAccount user;
  final VoidCallback? onPreviewCv;
  final VoidCallback? onRemoveAvatar;
  final String planLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppGlassSurface(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Stack(
            children: [
              _Avatar(url: user.avatarUrl, name: user.displayName),
              if (onRemoveAvatar != null)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton.filled(
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(6),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: onRemoveAvatar,
                    icon: const Icon(Icons.close_rounded, size: 16),
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.displayName,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    if (onPreviewCv != null)
                      TextButton.icon(
                        onPressed: user.cvUrl != null && user.cvUrl!.isNotEmpty
                            ? onPreviewCv
                            : null,
                        icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
                        label: const Text('Xem CV'),
                      ),
                  ],
                ),
                if (user.email.contains('@')) ...[
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xs,
                  children: [
                    _Chip(
                      icon: Icons.card_membership_outlined,
                      label: planLabel,
                      color: scheme.secondary,
                    ),
                    _Chip(
                      icon: Icons.account_balance_wallet_outlined,
                      label: ProfileUiUtils.formatVnd(user.walletBalance),
                      color: scheme.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.04);
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.url, required this.name});

  final String? url;
  final String name;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final initials = _initials(name);

    Widget child;
    if (url != null && url!.trim().isNotEmpty) {
      child = ClipOval(
        child: Image.network(
          url!,
          width: 72,
          height: 72,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _gradientAvatar(scheme, initials),
        ),
      );
    } else {
      child = _gradientAvatar(scheme, initials);
    }

    return SizedBox(width: 72, height: 72, child: child);
  }

  Widget _gradientAvatar(ColorScheme scheme, String initials) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [scheme.primary, scheme.secondary]),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  String _initials(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    }
    return value.isNotEmpty ? value[0].toUpperCase() : '?';
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
