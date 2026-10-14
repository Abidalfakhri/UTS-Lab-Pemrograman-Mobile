import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const QuizApp());
}

/// Root aplikasi (StatelessWidget karena tidak menyimpan state sendiri).
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizKu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const Scaffold(body: Center(child: Text('QuizKu'))),
    );
  }
}
