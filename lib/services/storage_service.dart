// Serviço responsável por armazenar e recuperar informações locais do app,
// como o status de visualização da tela de onboarding (logo inicial, por exemplo).

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Chave usada para verificar se o usuário já visualizou o onboarding
  static const String onboardingSeenKey = 'onboardingSeen';

  // Retorna true se o usuario já viu o onboarding, false caso contrário
  Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingSeenKey) ?? false;
  }

  // Salva local que o usuario já viu o onboarding
  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingSeenKey, true);
  }
}
