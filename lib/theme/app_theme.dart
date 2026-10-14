import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String fontFamily = 'Poppins';

  static const Color brown = Color(0xFF4A2C20);
  static const Color olive = Color(0xFF8FA45B);
  static const Color peach = Color(0xFFF6DDBC);
  static const Color cream = Color(0xFFF5F0EA);
  static const Color card = Color(0xFFFCFAF7);

  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: brown,
    onPrimary: Color(0xFFFFF8F0),
    primaryContainer: peach,
    onPrimaryContainer: brown,
    secondary: olive,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFE3EBCF),
    onSecondaryContainer: brown,
    error: Color(0xFFC5523F),
    onError: Colors.white,
    surface: cream,
    onSurface: brown,
    onSurfaceVariant: Color(0xFF8A7A70),
    outline: Color(0xFFD9CCC0),
    outlineVariant: Color(0xFFE6DCD2),
    surfaceContainerHighest: card,
  );

  static ThemeData light() => _build(lightScheme);

  static ThemeData _build(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        foregroundColor: scheme.onSurface,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.secondary,
        linearTrackColor: scheme.outlineVariant,
      ),
    );
  }
}
