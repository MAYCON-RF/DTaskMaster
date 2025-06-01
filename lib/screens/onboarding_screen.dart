import 'package:flutter/material.dart';
import 'package:desafio_task_master/widgets/onboarding_page.dart';
import 'package:desafio_task_master/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => OnboardingPage()),
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/logo_dtaskmaster.png',
                height: 300,
              ),
            ),
            Positioned(
              right: 24,
              bottom: 32,
              child: Row(
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Arraste para',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        'começar',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
