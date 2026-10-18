import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.watch<ThemeProvider>().isDark(context);
    return IconButton.filledTonal(
      tooltip: dark ? 'Mode terang' : 'Mode gelap',
      onPressed: () => context.read<ThemeProvider>().toggle(context),
      icon: Icon(dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
    );
  }
}
