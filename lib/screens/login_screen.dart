import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_login_button.dart';
import '../screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Ilustração superior
            Expanded(
              flex: 2,
              child: Image.asset('assets/image_register.png'),
            ),

            // Área inferior com formulário
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,                    children: [
                      const SizedBox(height: 16),

                      // Campo de e-mail
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 48,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'E-mail ou usuário',
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Campo de senha
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 48,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Botão de entrar com gradiente
                      Center(
                        child: SizedBox(
                          width: 205,
                          height: 50,
                          child: GradientButton(
                            text: 'Entrar',
                            onTap: () {
                              // ação de login
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Botão Google
                      SizedBox(
                        height: 48,
                        child: SocialLoginButton(
                          iconPath: 'assets/google_logo.png',
                          text: 'Entrar com Google',
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Botão Facebook
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 48,
                        child: SocialLoginButton(
                          iconPath: 'assets/facebook_logo.png',
                          text: 'Entrar com Facebook',
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Link para registro
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Não tenho uma conta!",
                          style: AppTextStyles.link,
                        ),
                        ),

                      ),
                    const SizedBox(height: 8),

                      // Link de esqueci a senha
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // lógica de recuperação
                          },
                          child: const Text("Esqueceu a senha?"),
                        ),
                      ),
                    const SizedBox(height: 8),
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
