import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String fontFamily = 'Poppins';
  static const Color seed = Color(0xFF6246EA);
  static const Color accent = Color(0xFFFFB020);
  static const Color success = Color(0xFF2E9E6B);
  static const Color danger = Color(0xFFE5484D);

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: scheme.onSurface,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: scheme.onSurface,
        ),
      ),
    );
  }
}
