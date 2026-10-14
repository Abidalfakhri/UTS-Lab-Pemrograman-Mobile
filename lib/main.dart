import 'package:flutter/material.dart';

import 'screens/welcome_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizKu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const WelcomePage(),
    );
  }
}
