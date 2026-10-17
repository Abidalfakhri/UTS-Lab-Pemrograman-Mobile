import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
    required this.number,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
    required this.isCorrect,
  });

  final int number;
  final String question;
  final String? userAnswer;
  final String correctAnswer;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = isCorrect ? scheme.secondary : scheme.error;

    return Container(
      margin: EdgeInsets.only(bottom: context.hp(1.5)),
      padding: EdgeInsets.all(context.wp(4)),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: color,
            size: context.sp(24),
          ),
          SizedBox(width: context.wp(3)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$number. $question',
                  style: TextStyle(
                    fontSize: context.sp(13.5),
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurface,
                  ),
                ),
                SizedBox(height: context.hp(0.6)),
                Text(
                  'Jawabanmu: ${userAnswer ?? '-'}',
                  style: TextStyle(fontSize: context.sp(12), color: color),
                ),
                if (!isCorrect)
                  Text(
                    'Jawaban benar: $correctAnswer',
                    style: TextStyle(
                      fontSize: context.sp(12),
                      color: scheme.secondary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
