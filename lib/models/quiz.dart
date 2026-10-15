import 'question.dart';

class Quiz {
  const Quiz({
    required this.id,
    required this.title,
    required this.category,
    required this.minutes,
    required this.art,
    required this.questions,
  });

  final String id;
  final String title;
  final String category;
  final int minutes;
  final String art;
  final List<Question> questions;
}
