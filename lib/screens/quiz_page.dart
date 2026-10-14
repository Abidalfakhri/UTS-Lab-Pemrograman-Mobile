import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, required this.playerName});

  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Halo, $playerName!')),
    );
  }
}
