/*
  Controlador de Login (GetX)

  Este controller gerencia o estado e validação do formulário de login.
  Utiliza o pacote GetX para controle de estado e navegação simplificada.

  Responsabilidades:
  - Gerenciar os TextEditingControllers de e-mail e senha
  - Validar os campos do formulário
  - Executar ação de login simulada
*/


// Importações dos pacotes
import 'package:get/get.dart';
import 'package:flutter/material.dart';


// Controller específico para a tela de login
class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;


  // Inicializa os controladores ao criar o controller
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  // Libera os recursos ao fechar o controller
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  // Validação do campo de e-mail
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail.';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }


  // Validação do campo de senha
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha.';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }
    return null;
  }


  // Lógica de autenticação fictícia
  void doLogin() {
    if (loginFormKey.currentState!.validate()) {
      // Login bem-sucedido (simulado)
      Get.snackbar(
        'Login',
        'Login bem-sucedido!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Validação falhou
      Get.snackbar(
        'Erro',
        'Por favor, preencha todos os campos corretamente.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
