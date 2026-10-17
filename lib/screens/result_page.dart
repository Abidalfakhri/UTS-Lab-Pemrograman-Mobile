import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/app_logo.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';
import '../widgets/review_tile.dart';
import '../widgets/screen_header.dart';
import 'quiz_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  String _message(double ratio) {
    if (ratio >= 0.8) return 'Luar biasa, pertahankan!';
    if (ratio >= 0.5) return 'Bagus, terus belajar!';
    return 'Jangan menyerah, coba lagi!';
  }

  void _retry(BuildContext context, QuizProvider quiz) {
    quiz.start(quiz.quiz);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const QuizPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final scheme = Theme.of(context).colorScheme;
    final ratio = quiz.score / quiz.total;

    return Scaffold(
      body: GradientBackground(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(6),
            vertical: context.hp(2),
          ),
          children: [
            ScreenHeader(title: 'Hasil Kuis', subtitle: quiz.quiz.title),
            SizedBox(height: context.hp(2.5)),
            Container(
              padding: EdgeInsets.all(context.wp(5)),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: scheme.outlineVariant),
              ),
              child: Column(
                children: [
                  const AppLogo(
                    asset: 'assets/images/trophy.png',
                    sizePercent: 24,
                  ),
                  SizedBox(height: context.hp(1.5)),
                  Text(
                    quiz.playerName,
                    style: TextStyle(
                      fontSize: context.sp(16),
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurface,
                    ),
                  ),
                  Text(
                    '${quiz.score} / ${quiz.total}',
                    style: TextStyle(
                      fontSize: context.sp(48),
                      fontWeight: FontWeight.w700,
                      color: scheme.secondary,
                    ),
                  ),
                  Text(
                    _message(ratio),
                    style: TextStyle(
                      fontSize: context.sp(13),
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.hp(3)),
            Text(
              'Review Jawaban',
              style: TextStyle(
                fontSize: context.sp(14),
                fontWeight: FontWeight.w600,
                color: scheme.onSurface,
              ),
            ),
            SizedBox(height: context.hp(1.5)),
            for (var i = 0; i < quiz.total; i++)
              ReviewTile(
                number: i + 1,
                question: quiz.questions[i].text,
                userAnswer: quiz.answers[i] == null
                    ? null
                    : quiz.questions[i].options[quiz.answers[i]!],
                correctAnswer:
                    quiz.questions[i].options[quiz.questions[i].correctIndex],
                isCorrect: quiz.answers[i] == quiz.questions[i].correctIndex,
              ),
            SizedBox(height: context.hp(1)),
            PrimaryButton(
              label: 'Kembali ke Beranda',
              icon: Icons.home_rounded,
              onPressed: () => Navigator.of(context)
                  .popUntil((route) => route.settings.name == 'home'),
            ),
            SizedBox(height: context.hp(1)),
            TextButton(
              onPressed: () => _retry(context, quiz),
              child: Text(
                'Ulangi Kuis',
                style: TextStyle(
                  fontSize: context.sp(14),
                  color: scheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
