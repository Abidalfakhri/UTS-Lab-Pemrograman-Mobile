import 'package:flutter/foundation.dart';

import '../models/question.dart';
import '../models/quiz.dart';

class QuizProvider extends ChangeNotifier {
  String _playerName = '';
  Quiz? _quiz;
  int _currentIndex = 0;
  List<int?> _answers = [];
  final Map<String, int> _scores = {};

  String get playerName => _playerName;
  Quiz get quiz => _quiz!;
  int get currentIndex => _currentIndex;
  List<int?> get answers => List.unmodifiable(_answers);
  List<Question> get questions => quiz.questions;
  int get total => quiz.questions.length;
  Question get currentQuestion => quiz.questions[_currentIndex];
  int? get currentAnswer => _answers[_currentIndex];
  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == total - 1;

  int get score {
    var result = 0;
    for (var i = 0; i < total; i++) {
      if (_answers[i] == quiz.questions[i].correctIndex) result++;
    }
    return result;
  }

  int? scoreOf(String quizId) => _scores[quizId];

  void setPlayerName(String name) {
    _playerName = name;
    notifyListeners();
  }

  void start(Quiz quiz) {
    _quiz = quiz;
    _currentIndex = 0;
    _answers = List<int?>.filled(quiz.questions.length, null);
    notifyListeners();
  }

  void select(int option) {
    _answers[_currentIndex] = option;
    notifyListeners();
  }

  void next() {
    if (!isLast) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previous() {
    if (!isFirst) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void finish() {
    _scores[quiz.id] = score;
    notifyListeners();
  }
}
