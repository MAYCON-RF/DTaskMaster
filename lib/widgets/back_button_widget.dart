/*
  Componente: Botão Voltar Personalizado

  Este widget exibe um botão de voltar no canto superior esquerdo da tela.
  Pode navegar entre páginas de um PageController ou voltar à tela anterior.

  Parâmetros:
  - currentPage: página atual (para decidir se volta ou finaliza)
  - pageController: controlador de navegação entre páginas (opcional)
  - onFirstPage: ação customizada ao clicar no botão estando na primeira página
  - useGradientStyle: exibe o botão com fundo em gradiente se verdadeiro
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';


// Widget reutilizável para navegação com botão de voltar
class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onFirstPage;
  final PageController? pageController;
  final int currentPage;
  final bool useGradientStyle;

  const BackButtonWidget({
    Key? key,
    this.pageController,
    required this.currentPage,
    this.onFirstPage,
    this.useGradientStyle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          if (currentPage > 0 && pageController != null) {
            // Volta para a página anterior do onboarding
            pageController!.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            // Executa ação customizada ou simplesmente fecha a tela
            if (onFirstPage != null) {
              onFirstPage!();
            } else {
              Navigator.pop(context);
            }
          }
        },


        // Estilo com gradiente circular (se ativado)
        child: useGradientStyle
            ? Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.blueGradientStart,
                AppColors.blueGradientEnd,
              ],
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        )

        // Estilo padrão com ícone branco simples
            : const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.textLight,
        ),
      ),
    );
  }
}
