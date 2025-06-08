import 'package:flutter/material.dart';
import 'dart:async';
import 'package:desafio_task_master/screens/onboarding_screen.dart';
import '../services/storage_service.dart';
import 'package:desafio_task_master/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    _navigate();
  }

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
