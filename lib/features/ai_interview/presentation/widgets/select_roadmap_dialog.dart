import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

/// Modal chọn 7 / 14 ngày lộ trình luyện tập (parity SelectRoadmapModal).
class SelectRoadmapDialog extends StatefulWidget {
  const SelectRoadmapDialog({
    required this.onConfirm,
    super.key,
    this.isLoading = false,
  });

  final ValueChanged<int> onConfirm;
  final bool isLoading;

  static Future<int?> show(BuildContext context, {bool isLoading = false}) {
    return showDialog<int>(
      context: context,
      builder: (ctx) => SelectRoadmapDialog(
        isLoading: isLoading,
        onConfirm: (days) => Navigator.of(ctx).pop(days),
      ),
    );
  }

  @override
  State<SelectRoadmapDialog> createState() => _SelectRoadmapDialogState();
}

class _SelectRoadmapDialogState extends State<SelectRoadmapDialog> {
  int _selected = 14;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Chọn lộ trình học tập'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Chọn thời gian phù hợp với mục tiêu và cường độ luyện tập của bạn',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _RoadmapOption(
                days: 7,
                label: '7 Ngày',
                tag: 'Cấp tốc',
                selected: _selected == 7,
                onTap: () => setState(() => _selected = 7),
              ),
              const SizedBox(width: 8),
              _RoadmapOption(
                days: 14,
                label: '14 Ngày',
                tag: 'Khuyến dùng',
                selected: _selected == 14,
                recommended: true,
                onTap: () => setState(() => _selected = 14),
              ),
              const SizedBox(width: 8),
              _RoadmapOption(
                days: 21,
                label: '21 Ngày',
                tag: 'Sắp ra mắt',
                selected: false,
                disabled: true,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: widget.isLoading ? null : () => Navigator.pop(context),
          child: const Text('Hủy bỏ'),
        ),
        AppPrimaryButton(
          label: widget.isLoading ? 'Đang tạo...' : 'Xác nhận',
          isLoading: widget.isLoading,
          onPressed: widget.isLoading ? null : () => widget.onConfirm(_selected),
        ),
      ],
    );
  }
}

class _RoadmapOption extends StatelessWidget {
  const _RoadmapOption({
    required this.days,
    required this.label,
    required this.tag,
    required this.selected,
    required this.onTap,
    this.recommended = false,
    this.disabled = false,
  });

  final int days;
  final String label;
  final String tag;
  final bool selected;
  final bool recommended;
  final bool disabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Expanded(
      child: Opacity(
        opacity: disabled ? 0.45 : 1,
        child: Material(
          color: selected ? primary.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: disabled ? null : onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selected ? primary : Theme.of(context).dividerColor,
                  width: selected ? 2 : 1,
                ),
              ),
              child: Column(
                children: [
                  if (recommended)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Khuyến dùng',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  Icon(
                    days == 7 ? Icons.bolt : Icons.calendar_month,
                    color: primary,
                  ),
                  const SizedBox(height: 6),
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(tag, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
