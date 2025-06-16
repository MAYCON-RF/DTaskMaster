/*
  Controlador do Onboarding

  Este controlador gerencia a navegação entre as páginas do onboarding e armazena se o usuário já visualizou o fluxo.

  Responsabilidades:
  - Controlar o PageView do onboarding
  - Salvar no armazenamento local quando o onboarding for concluído
  - Atualizar o índice da página atual
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import '../services/storage_service.dart';


// Controller simples, sem GetX, usado diretamente na tela de Onboarding
class OnboardingController {
  final PageController pageController = PageController();
  int currentPage = 0;

  // Serviço de armazenamento para salvar se o onboarding já foi concluído
  final StorageService storageService = StorageService();


  // Avança para a próxima página ou executa callback se estiver na última
  void nextPage(VoidCallback onLastPage) {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      storageService.setOnboardingSeen();
      onLastPage();
    }
  }


  // Atualiza o índice da página atual com base no PageView
  void updatePage(int index) {
    currentPage = index;
  }


  // Libera recursos do controlador de página
  void dispose() {
    pageController.dispose();
  }
}
