import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(DTaskMasterApp());
}

class DTaskMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DTask Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
