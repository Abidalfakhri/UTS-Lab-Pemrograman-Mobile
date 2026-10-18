import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get mode => _mode;

  bool isDark(BuildContext context) =>
      _mode == ThemeMode.dark ||
      (_mode == ThemeMode.system &&
          MediaQuery.platformBrightnessOf(context) == Brightness.dark);

  void toggle(BuildContext context) {
    _mode = isDark(context) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
