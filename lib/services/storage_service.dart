/*
  Serviço de Armazenamento Local

  Este serviço é responsável por salvar e recuperar informações persistentes localmente no dispositivo,
  utilizando a biblioteca `shared_preferences`.

  Funcionalidade atual:
  - Armazenar se o usuário já visualizou a tela de onboarding
*/


// Importações dos pacotes
import 'package:shared_preferences/shared_preferences.dart';


// Serviço que gerencia o armazenamento local de preferências do usuário
class StorageService {
  // Chave usada para verificar se o usuário já visualizou o onboarding
  static const String onboardingSeenKey = 'onboardingSeen';


  // Retorna true se o usuário já viu o onboarding, false caso contrário
  Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingSeenKey) ?? false;
  }


  // Salva localmente que o usuário já visualizou o onboarding
  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingSeenKey, true);
  }
}
