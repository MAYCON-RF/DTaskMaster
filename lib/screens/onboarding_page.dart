// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/models/onboarding_model.dart';
import '../core/app_theme.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/page_indicator.dart';
import '../services/storage_service.dart';
import '../widgets/gradient_button.dart';
import 'login_screen.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final StorageService _storageService = StorageService();

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/onboarding_task.png',
      title: 'Organize sua\nvida com\nfacilidade 📌',
      subtitle:
      'Crie, edite e acompanhe suas tarefas em um só lugar. Mantenha o controle do seu dia de forma simples e intuitiva.',
      color: AppColors.primary,
    ),
    OnboardingModel(
      image: 'assets/onboarding_focus.png',
      title: 'Foque no que\nrealmente\nimporta ⚡',
      subtitle:
      'Classifique suas atividades por prioridade e categorias. Gerencie o que é urgente e o que pode esperar, com total clareza.',
      color: AppColors.primary,
    ),
    OnboardingModel(
      image: 'assets/onboarding_alert.png',
      title: 'Nunca mais\nperca um\nprazo',
      subtitle:
      'Receba alertas e lembretes automáticos para manter suas tarefas em dia. Seu planejamento sempre na palma da mão.',
      color: AppColors.primary,
    ),
    OnboardingModel(
      image: 'assets/onboarding_calendar.png',
      title: 'Tudo conectado,\nsem esforço',
      subtitle:
      'Sincronize suas tarefas diretamente com o Google Calendar e visualize seus compromissos em um só lugar.',
      color: AppColors.primary,
    ),
  ];

  void _onNext() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() async {
    await _storageService.setOnboardingSeen();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }


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
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackButtonWidget(
                          pageController: _pageController,
                          currentPage: _currentPage,
                        ),
                        const SizedBox(height: 30),

                        // Imagem centralizada
                        Center(child: Image.asset(page.image, height: 160)),
                        const SizedBox(height: 30),

                        // Título com espaçamento lateral
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            page.title,
                            style: AppTextStyles.title.copyWith(
                              color: page.color,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Subtítulo com espaçamento lateral e largura limitada
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.9,
                            ),
                            child: Text(
                              page.subtitle,
                              style: AppTextStyles.subtitle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),

                        const SizedBox(height: 48),

                        PageIndicator(
                          currentIndex: _currentPage,
                          itemCount: pages.length,
                        ),

                        const SizedBox(height: 32),

                        // altura entre indicadores e botão
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GradientButton(
                                text: _currentPage == pages.length - 1
                                    ? 'Começar!'
                                    : 'Próximo',
                                onTap: _onNext,
                              ),
                            ],
                          ),
                        ),
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
