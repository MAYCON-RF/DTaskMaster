/*
  Componente reutilizável: Indicador de Página

  Este widget exibe uma linha de bolinhas que indicam qual página está sendo visualizada dentro de um PageView.
  Ideal para utilizar em fluxos de onboarding, tutoriais ou carrosséis.

  Parâmetros:
  - itemCount: número total de páginas.
  - currentIndex: índice da página atualmente visível.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

// Widget sem estado, ideal para elementos visuais mais simples
class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(


      // Centraliza os indicadores na horizontal
      mainAxisAlignment: MainAxisAlignment.center,


      // Gera dinamicamente os círculos com base no número total de páginas do view
      children: List.generate(
        itemCount,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4), // Espaçamento entre os círculos
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            // Define a cor do círculo atual como mais clara (ativo), os outros mais escuros (inativo)
            color: currentIndex == index
                ? AppColors.textLight
                : AppColors.indicatorInactive,
          ),
        ),
      ),
    );
  }
}