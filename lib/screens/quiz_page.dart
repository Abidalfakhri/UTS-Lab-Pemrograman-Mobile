import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../utils/responsive.dart';
import '../widgets/gradient_background.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/quiz_progress_bar.dart';
import '../widgets/screen_header.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.playerName, required this.quiz});

  final String playerName;
  final Quiz quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const _letters = ['A', 'B', 'C', 'D', 'E'];

  int _index = 0;
  late final List<int?> _answers =
      List<int?>.filled(widget.quiz.questions.length, null);

  bool get _isLast => _index == widget.quiz.questions.length - 1;

  int get _score {
    var result = 0;
    for (var i = 0; i < _answers.length; i++) {
      if (_answers[i] == widget.quiz.questions[i].correctIndex) result++;
    }
    return result;
  }

  void _next() {
    if (!_isLast) {
      setState(() => _index++);
      return;
    }
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Text('Skor ${widget.playerName}'),
        content: Text('$_score / ${widget.quiz.questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Selesai'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_index];
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight),
              QuizProgressBar(
                current: _index + 1,
                total: widget.quiz.questions.length,
              ),
              SizedBox(height: context.hp(2)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ScreenHeader(
                        title: widget.quiz.title,
                        subtitle: 'Halo, ${widget.playerName}',
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
                          isSelected: _answers[_index] == i,
                          onTap: () => setState(() => _answers[_index] = i),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.hp(2)),
                child: Row(
                  children: [
                    if (_index > 0) ...[
                      IconButton.filledTonal(
                        onPressed: () => setState(() => _index--),
                        icon: const Icon(Icons.arrow_back_rounded),
                        tooltip: 'Sebelumnya',
                      ),
                      SizedBox(width: context.wp(3)),
                    ],
                    Expanded(
                      child: PrimaryButton(
                        label: _isLast ? 'Selesai' : 'Lanjut',
                        icon: _isLast
                            ? Icons.flag_rounded
                            : Icons.arrow_forward_rounded,
                        onPressed: _answers[_index] == null ? null : _next,
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
