import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AiTypingIndicator extends StatelessWidget {
  const AiTypingIndicator({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Dot(delay: 0),
        const SizedBox(width: 4),
        _Dot(delay: 200),
        const SizedBox(width: 4),
        _Dot(delay: 400),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.delay});

  final int delay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
    )
        .animate(onPlay: (c) => c.repeat())
        .fadeIn(duration: 300.ms, delay: Duration(milliseconds: delay))
        .then()
        .fadeOut(duration: 300.ms);
  }
}
