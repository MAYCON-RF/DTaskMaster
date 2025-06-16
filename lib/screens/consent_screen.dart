/*
  Componente: Consent Screen

  Descrição:
  Este arquivo contém a definição do componente consent_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/

import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';
import 'package:desafio_task_master/screens/login_screen.dart'; // ✅ Import da tela de login

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Autenticação Google'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Logo central do app
            Center(
              child: Image.asset(
                'assets/logo_dtaskmaster3.png',
                height: 80,
              ),
            ),
            const SizedBox(height: 24),

            // Título de acesso
            const Text(
              'O app DTaskMaster quer acessar sua Conta do Google',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            const Text(
              'usuario@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Ações permitidas
            const Text(
              'Isso permitirá ao app DTaskMaster as seguintes ações:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Linha com o ícone do Google Calendar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/onboarding_calendar.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Ver, editar, compartilhar e excluir permanentemente todos os calendários que você pode acessar usando o Google Calendar.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Aviso de segurança
            const Text(
              'Confirme se o app DTaskMaster é confiável',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Você pode estar compartilhando informações confidenciais com este app. '
                  'Você pode ver ou remover o acesso a qualquer momento na sua Conta do Google.',
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Abrir link seguro
              },
              child: const Text(
                'Compartilhar dados de maneira segura',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Consulte a Política de Privacidade e os Termos de Serviço do app DTaskMaster.',
            ),
            const Spacer(),

            // Botões de ação
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // ✅ Direciona para a tela de login
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Permitir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
