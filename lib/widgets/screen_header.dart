import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: context.sp(28),
            fontWeight: FontWeight.w700,
            color: scheme.onSurface,
            height: 1.2,
          ),
        ),
        SizedBox(height: context.hp(0.8)),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: context.sp(13),
            color: scheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
