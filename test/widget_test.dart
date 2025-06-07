import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_task_master/screens/splash_screen.dart'; // ajuste para o nome do seu projeto

void main() {
  testWidgets('SplashScreen is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
