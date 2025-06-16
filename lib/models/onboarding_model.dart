/*
  Modelo de Dados do Onboarding

  Esta classe representa as informações de cada página do fluxo de onboarding.

  Campos:
  - image: caminho do ativo visual exibido
  - title: título principal da página
  - subtitle: descrição complementar
  - color: cor de destaque (usada no título)
*/


// Importações dos pacotes
import 'package:flutter/material.dart';


// Modelo de dados para uma página do onboarding
class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;
  final Color color;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}
