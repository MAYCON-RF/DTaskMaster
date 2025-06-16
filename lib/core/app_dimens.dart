/*
  Classe de Dimensões Padrão da Aplicação

  Esta classe centraliza os valores de espaçamento, tamanhos de botões, ícones, textos e proporções utilizadas no app.
  Serve como referência única para manter a consistência visual entre os componentes da interface.

  Agrupamentos:
  - Padding e Margin
  - Tamanhos de botões
  - Raio de bordas
  - Tamanho de ícones
  - Altura de imagens
  - Fontes
*/


class AppDimens {
  // Espaçamentos internos e externos
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;


  // Dimensões de botões
  static const double buttonHeight = 50.0;
  static const double buttonWidthLarge = 205.0;
  static const double buttonWidthMedium = 220.0;
  static const double socialButtonHeight = 48.0;


  // Proporção de largura dos campos de formulário (em relação à tela)
  static const double fieldWidthRatio = 0.85;


  // Raio de bordas
  static const double borderRadiusSmall = 12.0;
  static const double borderRadiusMedium = 24.0;
  static const double borderRadiusLarge = 30.0;


  // Tamanho de ícones
  static const double iconSizeSmall = 18.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 40.0;


  // Altura padrão das imagens do onboarding
  static const double imageOnboardingHeight = 160.0;


  // Tamanhos de fonte
  static const double textFontSizeSmall = 13.0;
  static const double textFontSizeMedium = 14.0;
  static const double textFontSizeLarge = 16.0;
  static const double textFontSizeTitle = 20.0;
  static const double textFontSizeOnboardingTitle = 30.0;
}
