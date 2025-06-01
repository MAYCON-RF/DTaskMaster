import 'package:desafio_task_master/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/theme/app_colors.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingScreen()), // <- novo widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          'assets/logo_dtaskmaster.png',
          height: 250,
        ),
      ),
    );
  }
}
