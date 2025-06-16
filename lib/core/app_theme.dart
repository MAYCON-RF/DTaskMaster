/*
  Tema da Aplicação

  Este arquivo centraliza as definições de estilo utilizadas no app, incluindo:
  - Cores padrão (AppColors)
  - Estilos de texto (AppTextStyles)
  - Gradientes (AppGradients)
  - Tema global do Flutter (ThemeData)
*/


// Importações dos pacotes
import 'package:flutter/material.dart';


// Paleta de cores padrão do aplicativo
class AppColors {
  static const background = Color(0xFF121212); // Fundo principal escuro
  static const primaryLogin = Color(0xFF3D52E8); // Azul para títulos e botões
  static const primaryLight = Color(0xFF877FDF); // Variação mais clara do azul
  static const primaryTitleOnboarding = Color(0xFFFEDC56); // Amarelo usado no título do onboarding

  // Gradientes azulados (usado em botões e interações)
  static const blueGradientStart = Color(0xFF9BE6F3);
  static const blueGradientEnd = Color(0xFF3D52E8);

  // Cores de texto
  static const textLight = Color(0xFFFFFFFF); // Branco para textos claros
  static const textSubtitle = Color(0xFF000000); // Preto para subtítulos
  static const textDark = Color(0xFF000000); // Preto para textos escuros
  static const textPrimary = Color(0xFFFFFFFF); // Texto branco principal
  static const textSecondary = Color(0xFFB0B0B0); // Texto secundário em cinza claro

  // Bordas e caixas
  static const borderLight = Color(0xFFD4D3D2); // Bordas leves
  static const borderDark = Color(0xFF2C2C2C); // Bordas escuras
  static const boxPassword = Colors.white30; // Fundo do campo de senha

  // Indicadores visuais
  static const indicatorInactive = Colors.white30; // Bolinha de página inativa

  // Cores de feedback (validação de código)
  static const codeDefault = Colors.grey;
  static const codeValid = Colors.green;
  static const codeInvalid = Colors.redAccent;

  // Semântica de status
  static const Color primary = Color(0xFF00995D); // Verde institucional
  static const Color success = Color(0xFF4CAF50); // Verde sucesso
  static const Color warning = Color(0xFFFFC107); // Amarelo alerta
  static const Color error = Color(0xFFF44336);   // Vermelho erro
  static const Color surface = Color(0xFF1E1E1E);  // Cor de fundo para cartões
  static const Color disabled = Color(0xFF616161); // Cinza escuro para estados desabilitados
}


// Estilos de texto reutilizáveis
class AppTextStyles {
  static const title = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.primaryLogin,
  );

  static const social = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textDark,
  );

  static const subtitle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textLight,
  );

  static const button = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white,
  );

  static const link = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.primaryLogin,
    decoration: TextDecoration.underline,
  );
}


// Gradiente padrão utilizado em botões e categorias de prioridade
class AppGradients {
  static const button = LinearGradient(
    colors: [AppColors.blueGradientStart, AppColors.blueGradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Gradiente usado para tarefas de alta prioridade
  static const highPriority = LinearGradient(
    colors: [Color(0xFFF5272A), Color(0xFFDF9A9B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradiente usado para tarefas de prioridade média
  static const mediumPriority = LinearGradient(
    colors: [Color(0xFFE6E999), Color(0xFFF0DE15)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradiente usado para tarefas de baixa prioridade
  static const lowPriority = LinearGradient(
    colors: [Color(0xFFE7EEBA), Color(0xFFD0EFC6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}


// Tema global aplicado ao aplicativo Flutter
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.blueGradientEnd,
    selectionHandleColor: AppColors.blueGradientEnd,
    selectionColor: AppColors.blueGradientEnd.withOpacity(0.3),
  ),
);
