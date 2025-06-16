/*
  Tela de Boas-Vindas com logo

  Esta é a primeira tela exibida ao abrir o app, pela primeira vez
  Apresenta o logotipo centralizado e um gesto de arrasto lateral que leva ao onboarding.

  Componentes:
  - Logo do aplicativo
  - Instrução visual com texto e seta
  - Gesto horizontal para navegação
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/screens/onboarding_page.dart';
import '../core/app_theme.dart';


// Tela sem estado, usada como tela de abertura
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      // Ao detectar o gesto de arrasto lateral, navega para a proxima tela (OnboardingPage)
      onHorizontalDragEnd: (_) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => OnboardingPage()));
      },

      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [


            // Logo centralizado
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // 50% da altura da tela
                child: Image.asset(
                  'assets/logo_dtaskmaster2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),


            // Instruções fixas no canto inferior direito
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
