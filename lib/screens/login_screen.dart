/*
  Tela de Login do aplicativo

  Esta tela permite que o usuario realize o login no aplicativo por meio de e-mail senha ou autenticação social.
  Também oferece acesso a tela de registro e a opção de recuperação de senha.

  Componentes:
  - Campo de e-mail
  - Campo de senha (com widget reutilizável que oculta a senha e mostra com o botão de visível)
  - Botões de login (tradicional e social)
  - Navegação para registro e recuperação de senha
*/

import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_login_button.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart'; // ✅ Import da tela Home
import '../widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fieldWidth = size.width * 0.85;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            // Imagem ilustrativa na parte superior
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/image_register2.png',
                fit: BoxFit.contain,
              ),
            ),

            // Área inferior com campos e botões e demais componentes
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // Campo de e-mail
                        SizedBox(
                          width: fieldWidth,
                          child: TextField(
                            style: AppTextStyles.subtitle.copyWith(color: AppColors.textDark),
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              labelText: 'E-mail ou usuário',
                              labelStyle: AppTextStyles.subtitle.copyWith(color: AppColors.textSubtitle),
                              prefixIcon: Icon(Icons.email_outlined, color: AppColors.textDark),
                              filled: true,
                              fillColor: AppColors.boxPassword,
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColors.borderLight),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColors.blueGradientEnd, width: 2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Campo de senha
                        PasswordTextField(
                          label: 'Senha',
                          width: fieldWidth,
                        ),
                        const SizedBox(height: 24),

                        // Botão "Entrar" redireciona para a Home
                        GradientButton(
                          text: 'Entrar',
                          width: 205,
                          height: 50,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const HomeScreen()),
                                  (route) => false,
                            );
                          },
                        ),
                        const SizedBox(height: 24),

                        // Botão de login com Google redireciona para a Home
                        SizedBox(
                          width: fieldWidth,
                          height: 48,
                          child: SocialLoginButton(
                            iconPath: 'assets/google_logo.png',
                            text: 'Entrar com Google',
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => const HomeScreen()),
                                    (route) => false,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Botão de login com Facebook redireciona para a Home
                        SizedBox(
                          width: fieldWidth,
                          height: 48,
                          child: SocialLoginButton(
                            iconPath: 'assets/facebook_logo.png',
                            text: 'Entrar com Facebook',
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => const HomeScreen()),
                                    (route) => false,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Link para registro
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const RegisterScreen()),
                            );
                          },
                          child: const Text(
                            'Não tenho uma conta!',
                            style: AppTextStyles.link,
                          ),
                        ),

                        // Link para recuperação de senha (ação futura)
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueceu a senha?',
                            style: AppTextStyles.link,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
