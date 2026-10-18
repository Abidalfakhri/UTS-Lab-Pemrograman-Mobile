import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/app_logo.dart';
import '../widgets/gradient_background.dart';
import '../widgets/pill_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/screen_header.dart';
import '../widgets/theme_toggle_button.dart';
import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _start() {
    if (!_formKey.currentState!.validate()) return;
    context.read<QuizProvider>().setPlayerName(_nameController.text.trim());
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'home'),
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.wp(6)),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: context.hp(85)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLogo(),
                      ThemeToggleButton(),
                    ],
                  ),
                  SizedBox(height: context.hp(3)),
                  const ScreenHeader(
                    title: 'QuizKu',
                    subtitle: 'Uji pengetahuanmu seputar pemrograman & teknologi',
                  ),
                  SizedBox(height: context.hp(4)),
                  PillField(
                    controller: _nameController,
                    hint: 'Masukkan namamu...',
                    icon: Icons.person_outline_rounded,
                    onSubmitted: (_) => _start(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.hp(2.5)),
                  PrimaryButton(
                    label: 'Mulai',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: _start,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
