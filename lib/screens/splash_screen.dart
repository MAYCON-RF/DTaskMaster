import 'package:flutter/material.dart';
import 'dart:async';
import 'package:desafio_task_master/screens/onboarding_screen.dart';
import '../services/storage_service.dart';

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

    await Future.delayed(Duration(seconds: 2));
    if (seen) {
      // Navegação para home ou tela principal (placeholder por enquanto)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("Tela principal aqui"))),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
