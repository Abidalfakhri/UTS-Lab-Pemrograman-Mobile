import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: context.hp(1.5)),
      child: Material(
        color: isSelected ? scheme.primaryContainer : scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.wp(4),
              vertical: context.hp(1.6),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? scheme.primary : scheme.outline,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: context.sp(15),
                  backgroundColor: isSelected ? scheme.primary : scheme.surface,
                  foregroundColor: isSelected ? scheme.onPrimary : scheme.onSurface,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: context.sp(12.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: context.wp(3)),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: context.sp(14),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: scheme.onSurface,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle_rounded, color: scheme.secondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
