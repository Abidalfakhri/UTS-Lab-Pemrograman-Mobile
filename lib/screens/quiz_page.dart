import 'package:flutter/material.dart';

import '../models/quiz.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, required this.playerName, required this.quiz});

  final String playerName;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '${quiz.title}\nHalo, $playerName!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
