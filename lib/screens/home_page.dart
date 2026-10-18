import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/quizzes_data.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/category_chip.dart';
import '../widgets/gradient_background.dart';
import '../widgets/quiz_card.dart';
import '../widgets/screen_header.dart';
import '../widgets/theme_toggle_button.dart';
import 'quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _category = quizCategories.first;

  static const _categoryIcons = {
    'Semua': Icons.apps_rounded,
    'Flutter': Icons.phone_android_rounded,
    'Tools': Icons.build_outlined,
  };

  void _open(int quizIndex) {
    context.read<QuizProvider>().start(quizzesData[quizIndex]);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const QuizPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final state = context.watch<QuizProvider>();
    final visible = [
      for (var i = 0; i < quizzesData.length; i++)
        if (_category == quizCategories.first ||
            quizzesData[i].category == _category)
          i,
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          const ThemeToggleButton(),
          SizedBox(width: context.wp(3)),
        ],
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.wp(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight),
              ScreenHeader(
                title: 'Halo, ${state.playerName}',
                subtitle: 'Pilih kuis yang ingin kamu kerjakan',
              ),
              SizedBox(height: context.hp(3)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final category in quizCategories) ...[
                      CategoryChip(
                        label: category,
                        icon: _categoryIcons[category]!,
                        selected: _category == category,
                        onTap: () => setState(() => _category = category),
                      ),
                      SizedBox(width: context.wp(2)),
                    ],
                  ],
                ),
              ),
              SizedBox(height: context.hp(3)),
              Text(
                'Semua Kuis',
                style: TextStyle(
                  fontSize: context.sp(14),
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              SizedBox(height: context.hp(1.5)),
              for (final i in visible)
                QuizCard(
                  quiz: quizzesData[i],
                  statusText: state.scoreOf(quizzesData[i].id) == null
                      ? 'Belum Dimulai'
                      : 'Skor ${state.scoreOf(quizzesData[i].id)}/${quizzesData[i].questions.length}',
                  completed: state.scoreOf(quizzesData[i].id) != null,
                  onTap: () => _open(i),
                ),
              SizedBox(height: context.hp(2)),
            ],
          ),
        ),
      ),
    );
  }
}
