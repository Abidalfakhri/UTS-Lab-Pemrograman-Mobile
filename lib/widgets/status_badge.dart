import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.text, this.highlighted = false});

  final String text;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(2),
        vertical: context.hp(0.3),
      ),
      decoration: BoxDecoration(
        color: highlighted ? scheme.secondaryContainer : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: highlighted ? scheme.secondary : scheme.outline,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.sp(10.5),
          color: scheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
