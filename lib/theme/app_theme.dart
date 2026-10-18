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

  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFF2D3A8),
    onPrimary: Color(0xFF3A2218),
    primaryContainer: Color(0xFF4A3226),
    onPrimaryContainer: Color(0xFFF5E9DC),
    secondary: Color(0xFFA8BE72),
    onSecondary: Color(0xFF243010),
    secondaryContainer: Color(0xFF3F4A27),
    onSecondaryContainer: Color(0xFFF5E9DC),
    error: Color(0xFFE8806C),
    onError: Color(0xFF3A1008),
    surface: Color(0xFF241913),
    onSurface: Color(0xFFF3E9DF),
    onSurfaceVariant: Color(0xFFB9A89C),
    outline: Color(0xFF5A463B),
    outlineVariant: Color(0xFF463529),
    surfaceContainerHighest: Color(0xFF33251E),
  );

  static ThemeData light() => _build(lightScheme);

  static ThemeData dark() => _build(darkScheme);

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
