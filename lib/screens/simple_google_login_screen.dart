/*
  Componente: Simple Google Login Screen

  Descrição:
  Este arquivo contém a definição do componente simple_google_login_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/screens/consent_screen.dart';

class SimpleGoogleLoginScreen extends StatelessWidget {
  const SimpleGoogleLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign in with Google'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/logo_dtaskmaster3.png',
                height: 60,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Escolha uma conta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'para continuar para '),
                  TextSpan(
                    text: 'DTASK MASTER',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Contas
            _buildAccountTile(context, 'Maycon Rodrigues', 'email@gmail.com'),
            _buildAccountTile(context, 'Maycon Ferreira', 'email@gmail.com'),

            const Divider(height: 32),

            // Outra conta
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.person_outline),
              title: const Text('Usar outra conta'),
              onTap: () {
                // Ação ao usar outra conta
              },
            ),
            const SizedBox(height: 16),

            // Texto de privacidade
            const Text(
              'Para continuar, o Google compartilhará seu nome, endereço de e-mail, preferência de idioma e foto do perfil com a Empresa. '
                  'Antes de usar este aplicativo, você pode revisar a política de privacidade e os termos de serviço da Empresa.',
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),

            const Spacer(),

            // Rodapé
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Português (Brasil)',
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text('Ajuda', style: TextStyle(fontSize: 12)),
                      SizedBox(width: 12),
                      Text('Privacidade', style: TextStyle(fontSize: 12)),
                      SizedBox(width: 12),
                      Text('Termos', style: TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile(BuildContext context, String name, String email) {
    final avatarLetter = name.isNotEmpty ? name[0] : '?';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.deepPurple,
        child: Text(avatarLetter, style: const TextStyle(color: Colors.white)),
      ),
      title: Text(name, style: const TextStyle(fontSize: 16)),
      subtitle: Text(email, style: const TextStyle(color: Colors.grey)),
      onTap: () {
        // Ao tocar, navegar para a tela de consentimento
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ConsentScreen()),
        );
      },
    );
  }
}
