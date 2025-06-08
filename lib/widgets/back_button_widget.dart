/*
  Componente reutilizável de botão "Voltar".
  Pode ser usado em telas com PageView (como o onboarding),
  retrocedendo para a página anterior ou, se estiver na primeira página,
  executa uma ação personalizada ou fecha a tela.
*/

import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

class BackButtonWidget extends StatelessWidget {
  // Função a ser executada ao pressionar o botão na primeira página (opcional)
  final VoidCallback? onFirstPage;

  // Controlador do PageView, necessário para voltar páginas
  final PageController? pageController;

  // Página atual para verificar se está na primeira (índice 0)
  final int currentPage;

  const BackButtonWidget({
    Key? key,
    this.pageController,
    required this.currentPage,
    this.onFirstPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textLight),
        onPressed: () {
          if (currentPage > 0 && pageController != null) {
            // Se não for a primeira página, volta uma página no PageView
            pageController!.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            // Se for a primeira página, executa ação personalizada (se existir)
            if (onFirstPage != null) {
              onFirstPage!();
            } else {
              // Se nenhuma ação for fornecida, volta para a tela anterior
              Navigator.pop(context);
            }
          }
        },
      ),
    );
  }
}
