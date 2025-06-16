/*
  Tela de Onboarding

  Esta tela apresenta um fluxo introdutorio com multiplas páginas explicando os principais recursos do aplicativo.
  O usuario pode navegar entre as páginas e no final é direcionado a tela de login.

  Componentes:
  - PageView com conteudo informativo (imagem, título, descrição)
  - Indicador visual de progresso (PageIndicator)
  - Botão "Próximo" ou "Começar"
  - Armazenamento da visualização no StorageService,registrar localmente que o usuário já visualizou o onboarding
*/

// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/models/onboarding_model.dart';
import '../core/app_theme.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/page_indicator.dart';
import '../services/storage_service.dart';
import '../widgets/gradient_button.dart';
import 'login_screen.dart';


// Widget com estado, pois a pagina atual precisa ser monitorada
class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}


class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Serviço para salvar que o onboarding já foi visto pelo usuario
  final StorageService _storageService = StorageService();



  // Lista do page view com  modelos contendo imagem, título, descrição e cor para cada página
  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/onboarding_task.png',
      title: 'Organize sua\nvida com\nfacilidade 📌',
      subtitle:
      'Crie, edite e acompanhe suas tarefas em um só lugar. Mantenha o controle do seu dia de forma simples e intuitiva.',
      color: AppColors.primaryLogin,
    ),
    OnboardingModel(
      image: 'assets/onboarding_focus.png',
      title: 'Foque no que\nrealmente\nimporta ⚡',
      subtitle:
      'Classifique suas atividades por prioridade e categorias. Gerencie o que é urgente e o que pode esperar, com total clareza.',
      color: AppColors.primaryLogin,
    ),
    OnboardingModel(
      image: 'assets/onboarding_alert.png',
      title: 'Nunca mais\nperca um\nprazo',
      subtitle:
      'Receba alertas e lembretes automáticos para manter suas tarefas em dia. Seu planejamento sempre na palma da mão.',
      color: AppColors.primaryLogin,
    ),
    OnboardingModel(
      image: 'assets/onboarding_calendar.png',
      title: 'Tudo conectado,\nsem esforço',
      subtitle:
      'Sincronize suas tarefas diretamente com o Google Calendar e visualize seus compromissos em um só lugar.',
      color: AppColors.primaryLogin,
    ),
  ];


  // Avança para a próxima página ou finaliza o onboarding
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


  // Marca onboarding como visto e redireciona para o login
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


            // PageView com todas as páginas do onboarding
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


                        // Botão de voltar (visível a partir da segunda página)
                        BackButtonWidget(
                          pageController: _pageController,
                          currentPage: _currentPage,
                        ),
                        const SizedBox(height: 30),


                        // Imagem ilustrativa centralizada
                        Center(
                          child: Image.asset(
                            page.image,
                            height: 160,
                          ),
                        ),
                        const SizedBox(height: 30),


                        // Título do slide
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            page.title,
                            style: AppTextStyles.title.copyWith(
                              color: AppColors.primaryTitleOnboarding,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),


                        // Subtítulo explicativo
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


                        // Indicadores de progresso do onboarding
                        PageIndicator(
                          currentIndex: _currentPage,
                          itemCount: pages.length,
                        ),
                        const SizedBox(height: 32),


                        // Botão de ação: "Próximo" ou "Começar"
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