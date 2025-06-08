import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_login_button.dart';
import '../screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Imagem ilustrativa superior
            Expanded(
              flex: 2,
              child: Image.asset('assets/onboarding_task.png'),
            ),

            // Conteúdo inferior com formulário
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Entre com uma conta existente',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      // Botão Google
                      SocialLoginButton(
                        iconPath: 'assets/google_logo.png',
                        text: 'Entrar com Google',
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),

                      // Botão Facebook
                      SocialLoginButton(
                        iconPath: 'assets/facebook_logo.png',
                        text: 'Entrar com Facebook',
                        onTap: () {},
                      ),

                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),

                      const Text(
                        'Cadastro com E-mail e Senha',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Campo de E-mail
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          prefixIcon: const Icon(Icons.mail_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Campo de Senha
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Botão gradiente de cadastro
                      GradientButton(
                        text: 'Continuar Cadastro',
                        onTap: () {
                          // ação
                        },
                      ),
                      const SizedBox(height: 20),

                      // Switch de aceite de termos
                      Row(
                        children: [
                          Switch(
                            value: termsAccepted,
                            onChanged: (value) {
                              setState(() => termsAccepted = value);
                            },
                            activeColor: AppColors.primary,
                          ),
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Ao criar uma conta, você aceita nossos ',
                                style: TextStyle(color: Colors.black54),
                                children: [
                                  TextSpan(
                                    text: 'termos e condições',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  TextSpan(text: ' e nossa '),
                                  TextSpan(
                                    text: 'política de privacidade.',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Link para tela de login
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // volta para a tela anterior
                        },
                        child: const Text(
                          'Já tenho uma conta!',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
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
