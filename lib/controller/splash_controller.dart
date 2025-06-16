/*
  Controlador da Splash Screen

  Este controller verifica se o onboarding já foi visualizado pelo usuário.
  Utiliza um serviço de armazenamento local para tomar a decisão de navegação.

  Responsabilidades:
  - Consultar o status do onboarding
  - Retornar se a introdução deve ser exibida
*/


// Importações dos serviços
import '../services/storage_service.dart';


// Controller simples usado na splash screen
class SplashController {
  final StorageService _storageService = StorageService();


  // Verifica no armazenamento se o onboarding já foi concluído
  Future<bool> shouldShowOnboarding() async {
    return !(await _storageService.isOnboardingSeen());
  }
}
