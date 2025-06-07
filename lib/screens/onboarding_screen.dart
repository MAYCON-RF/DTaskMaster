import 'package:flutter/material.dart';
import 'package:desafio_task_master/screens/onboarding_page.dart';
import 'package:desafio_task_master/core/app_theme.dart';

/* Tela inicial do app que exibe o logo centralizado
   e permite iniciar o onboarding ao arrastar para o lado. */

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Ao detectar o gesto de arrasto lateral, navega para a próxima tela
      onHorizontalDragEnd: (_) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => OnboardingPage()),
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            // Logo central
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // 50% da altura da tela
                child: Image.asset(
                  'assets/logo_dtaskmaster.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Texto de instrução e seta fixos
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
