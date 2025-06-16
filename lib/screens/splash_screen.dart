/*
  Tela de Splash (Inicial)

  Esta tela é exibida por poucos segundos ao iniciar o app, enquanto verifica se o usuário já viu o onboarding.
  Redireciona automaticamente para a tela apropriada: Login ou Onboarding.

  Responsabilidades:
  - Verificar se o onboarding já foi visualizado
  - Aplicar pequeno atraso simulando carregamento (2 segundos)
  - Redirecionar para a próxima tela com base no status salvo
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:desafio_task_master/screens/onboarding_screen.dart';
import 'package:desafio_task_master/screens/login_screen.dart';
import '../services/storage_service.dart';


// Tela com estado usada para navegação automática após verificação
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  final _storageService = StorageService();


  // Inicia a lógica de navegação assim que o widget é carregado
  @override
  void initState() {
    super.initState();
    _navigate();
  }


  // Aguarda 2 segundos e navega com base no status do onboarding
  void _navigate() async {
    bool seen = await _storageService.isOnboardingSeen();

    await Future.delayed(const Duration(seconds: 2));

    if (seen) {
      // Navegação para tela de login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    } else {
      // Navegação para tela de onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    }
  }


  // Exibe indicador de carregamento enquanto aguarda navegação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
