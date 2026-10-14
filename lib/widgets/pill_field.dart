import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class PillField extends StatelessWidget {
  const PillField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.validator,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    OutlineInputBorder border(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: color),
        );

    return TextFormField(
      controller: controller,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: context.sp(14), color: scheme.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
        prefixIcon: Icon(icon, color: scheme.onSurface),
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: EdgeInsets.symmetric(vertical: context.hp(1.8)),
        enabledBorder: border(scheme.outline),
        focusedBorder: border(scheme.primary),
        errorBorder: border(scheme.error),
        focusedErrorBorder: border(scheme.error),
      ),
    );
  }
}
