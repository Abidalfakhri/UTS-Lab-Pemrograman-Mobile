import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/gradient_background.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/quiz_progress_bar.dart';
import '../widgets/screen_header.dart';
import '../widgets/theme_toggle_button.dart';
import 'result_page.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  static const _letters = ['A', 'B', 'C', 'D', 'E'];

  void _onNext(BuildContext context, QuizProvider quiz) {
    if (!quiz.isLast) {
      quiz.next();
      return;
    }
    quiz.finish();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ResultPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final question = quiz.currentQuestion;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          const ThemeToggleButton(),
          SizedBox(width: context.wp(3)),
        ],
      ),
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight),
              QuizProgressBar(current: quiz.currentIndex + 1, total: quiz.total),
              SizedBox(height: context.hp(2)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ScreenHeader(
                        title: quiz.quiz.title,
                        subtitle: 'Halo, ${quiz.playerName}',
                      ),
                      SizedBox(height: context.hp(2.5)),
                      Container(
                        padding: EdgeInsets.all(context.wp(5)),
                        decoration: BoxDecoration(
                          color: scheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: scheme.outlineVariant),
                        ),
                        child: Text(
                          question.text,
                          style: TextStyle(
                            fontSize: context.sp(16),
                            fontWeight: FontWeight.w600,
                            color: scheme.onSurface,
                            height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(height: context.hp(2.5)),
                      for (var i = 0; i < question.options.length; i++)
                        OptionTile(
                          label: _letters[i],
                          text: question.options[i],
                          isSelected: quiz.currentAnswer == i,
                          onTap: () => quiz.select(i),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.hp(2)),
                child: Row(
                  children: [
                    if (!quiz.isFirst) ...[
                      IconButton.filledTonal(
                        onPressed: quiz.previous,
                        icon: const Icon(Icons.arrow_back_rounded),
                        tooltip: 'Sebelumnya',
                      ),
                      SizedBox(width: context.wp(3)),
                    ],
                    Expanded(
                      child: PrimaryButton(
                        label: quiz.isLast ? 'Selesai' : 'Lanjut',
                        icon: quiz.isLast
                            ? Icons.flag_rounded
                            : Icons.arrow_forward_rounded,
                        onPressed: quiz.currentAnswer == null
                            ? null
                            : () => _onNext(context, quiz),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
