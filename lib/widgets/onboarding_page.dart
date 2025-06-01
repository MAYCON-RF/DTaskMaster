import 'package:flutter/material.dart';
import 'package:desafio_task_master/models/onboarding_model.dart';
import 'package:desafio_task_master/theme/app_colors.dart';
import 'package:desafio_task_master/theme/app_gradients.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/onboarding_task.png',
      title: 'Organize sua vida com facilidade',
      subtitle:
      'Crie, edite e acompanhe suas tarefas em um só lugar. Mantenha o controle do seu dia de forma simples e intuitiva.',
      color: AppColors.titlePrimary,
    ),
    OnboardingModel(
      image: 'assets/onboarding_focus.png',
      title: 'Foque no que realmente importa',
      subtitle:
      'Classifique suas atividades por prioridade e categorias. Gerencie o que é urgente e o que pode esperar, com total clareza.',
      color: AppColors.titlePrimary,
    ),
    OnboardingModel(
      image: 'assets/onboarding_alert.png',
      title: 'Nunca mais perca um prazo',
      subtitle:
      'Receba alertas e lembretes automáticos para manter suas tarefas em dia. Seu planejamento sempre na palma da mão.',
      color: AppColors.titlePrimary,
    ),
    OnboardingModel(
      image: 'assets/onboarding_calendar.png',
      title: 'Tudo conectado, sem esforço',
      subtitle:
      'Sincronize suas tarefas diretamente com o Google Calendar e visualize seus compromissos em um só lugar.',
      color: AppColors.titlePrimary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textLight),
                            onPressed: () {
                              if (_currentPage > 0) {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Image.asset(
                          page.image,
                          height: 160,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          page.title,
                          style: TextStyle(
                            color: page.color,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page.subtitle,
                          style: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                                (i) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == i
                                    ? AppColors.textLight
                                    : AppColors.indicatorInactive,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            if (_currentPage < pages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              // TODO: Navegar para tela principal do app
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                            decoration: BoxDecoration(
                              gradient: AppGradients.button,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              'Começar!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}