import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../utils/responsive.dart';
import 'status_badge.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.quiz,
    required this.statusText,
    required this.completed,
    required this.onTap,
  });

  final Quiz quiz;
  final String statusText;
  final bool completed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final artSize = context.wp(24).clamp(84.0, 130.0);

    return Padding(
      padding: EdgeInsets.only(bottom: context.hp(1.8)),
      child: Material(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
        elevation: 1.5,
        shadowColor: const Color(0x33000000),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(context.wp(4)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusBadge(text: statusText, highlighted: completed),
                      SizedBox(height: context.hp(1.2)),
                      Text(
                        quiz.title,
                        style: TextStyle(
                          fontSize: context.sp(15.5),
                          fontWeight: FontWeight.w600,
                          color: scheme.onSurface,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: context.hp(1.2)),
                      Wrap(
                        spacing: context.wp(3),
                        runSpacing: context.hp(0.5),
                        children: [
                          _Meta(
                            icon: Icons.schedule_rounded,
                            text: '${quiz.minutes} menit',
                          ),
                          _Meta(
                            icon: Icons.help_outline_rounded,
                            text: '${quiz.questions.length} soal',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.wp(3)),
                Container(
                  width: artSize,
                  height: artSize,
                  padding: EdgeInsets.all(artSize * 0.14),
                  decoration: BoxDecoration(
                    color: scheme.primaryContainer,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Image.asset(quiz.art, fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: context.sp(14), color: color),
        SizedBox(width: context.wp(1)),
        Text(text, style: TextStyle(fontSize: context.sp(11.5), color: color)),
      ],
    );
  }
}
