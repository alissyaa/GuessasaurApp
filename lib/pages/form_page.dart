import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guessasaur/constants/app_colors.dart';
import 'package:guessasaur/config/routes.dart';
import 'package:guessasaur/widgets/background.dart';
import 'package:guessasaur/widgets/responsive_center.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _nameController = TextEditingController();

  Future<void> _saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('playerName', name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ResponsiveCenter(
              maxWidth: 500,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmallScreen = constraints.maxWidth < 400;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'wait...',
                          style: TextStyle(
                            fontFamily: 'Jolly',
                            fontSize: isSmallScreen ? 40 * textScale : 52 * textScale,
                            color: AppColors.secondary,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'Who\'s there?',
                          style: TextStyle(
                            fontFamily: 'Jolly',
                            fontSize: isSmallScreen ? 60 * textScale : 80 * textScale,
                            color: AppColors.secondary,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Enter your name',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16 * textScale,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.secondary,
                                  hintText: 'your name',
                                  hintStyle: const TextStyle(color: AppColors.primary),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 52,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_nameController.text.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Please enter your name!'),
                                        ),
                                      );
                                      return;
                                    }

                                    await _saveName(_nameController.text);
                                    if (!mounted) return;
                                    context.go(AppRoutes.quiz);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: AppColors.primary,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
