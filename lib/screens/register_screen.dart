/*
  Componente: Register Screen

  Descrição:
  Este arquivo contém a definição do componente register_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_login_button.dart';
import '../widgets/password_text_field.dart';
import '../screens/register_step2_screen.dart';
import '../screens/login_screen.dart';
import '../screens/simple_google_login_screen.dart'; // tela padronizada

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool termsAccepted = false;

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
            // Imagem superior
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/image_register2.png',
                fit: BoxFit.contain,
              ),
            ),

            // Conteúdo inferior com formulário
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // Título
                      const Text(
                        'Entre com uma conta existente',
                        style: AppTextStyles.title,
                      ),
                      SizedBox(height: size.height * 0.02),

                      // Botão login com Google
                      SizedBox(
                        width: fieldWidth,
                        height: 48,
                        child: SocialLoginButton(
                          iconPath: 'assets/google_logo.png',
                          text: 'Entrar com Google',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SimpleGoogleLoginScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),

                      // Botão login com Facebook
                      SizedBox(
                        width: fieldWidth,
                        height: 48,
                        child: SocialLoginButton(
                          iconPath: 'assets/facebook_logo.png',
                          text: 'Entrar com Facebook',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SimpleGoogleLoginScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),

                      // Divisor com "ou"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryLogin,
                              thickness: 1,
                              endIndent: 8,
                            ),
                          ),
                          Text(
                            'ou',
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.primaryLogin,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryLogin,
                              thickness: 1,
                              indent: 8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),

                      // Subtítulo
                      const Text(
                        'Cadastro com E-mail e Senha',
                        style: AppTextStyles.title,
                      ),
                      SizedBox(height: size.height * 0.02),

                      // Campo E-mail
                      SizedBox(
                        width: fieldWidth,
                        child: TextField(
                          style: AppTextStyles.subtitle.copyWith(color: AppColors.textDark),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'E-mail',
                            labelStyle: AppTextStyles.subtitle.copyWith(color: AppColors.textSubtitle),
                            prefixIcon: const Icon(Icons.mail_outline, color: AppColors.textDark),
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
                      SizedBox(height: size.height * 0.015),

                      // Campo Senha
                      PasswordTextField(label: 'Senha', width: fieldWidth),
                      SizedBox(height: size.height * 0.03),

                      // Botão "Continuar Cadastro"
                      GradientButton(
                        text: 'Continuar Cadastro',
                        width: 205,
                        height: 50,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterStep2Screen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.03),

                      // Aceite de termos
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Switch(
                            value: termsAccepted,
                            onChanged: (value) {
                              setState(() => termsAccepted = value);
                            },
                            activeTrackColor: AppColors.blueGradientStart.withAlpha(100),
                            activeColor: AppColors.blueGradientEnd,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: AppTextStyles.subtitle.copyWith(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                                children: [
                                  const TextSpan(text: 'Ao criar uma conta, você aceita nossos '),
                                  TextSpan(
                                    text: 'termos e condições',
                                    style: const TextStyle(
                                      color: AppColors.primaryLogin,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                  ),
                                  const TextSpan(text: ' e nossa '),
                                  TextSpan(
                                    text: 'política de privacidade.',
                                    style: const TextStyle(
                                      color: AppColors.primaryLogin,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),

                      // Link para tela de login
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                                  (route) => false,
                            );
                          },
                          child: const Text(
                            'Já tenho uma conta!',
                            style: AppTextStyles.link,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
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
