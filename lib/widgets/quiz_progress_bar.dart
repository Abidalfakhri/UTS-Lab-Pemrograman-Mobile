import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soal $current dari $total',
          style: TextStyle(
            fontSize: context.sp(12.5),
            fontWeight: FontWeight.w500,
            color: scheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: context.hp(0.8)),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: context.hp(1).clamp(6.0, 10.0),
          ),
        ),
      ],
    );
  }
}
