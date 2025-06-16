/*
  Componente: Focus Mode Screen

  Descrição:
  Este arquivo contém a definição do componente focus_mode_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/screens/task_finish_screen.dart';

class FocusModeScreen extends StatelessWidget {
  const FocusModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem ocupa toda a tela
          SizedBox.expand(
            child: Image.asset(
              'assets/focus_weather.png',
              fit: BoxFit.cover,
            ),
          ),

          // Botão com estilo padrão, sobre a imagem
          Positioned(
            bottom: 20,
            left: 24,
            right: 24,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TaskFinishScreen(
                        title: 'Preparar Screens',
                        description: 'Finalização da interface de login com social login.',
                        date: DateTime.now(),
                      ),
                    ),
                  );

                  if (result != null && result['isDone'] == true) {
                    Navigator.pop(context, result); // volta para a Home com resultado
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF53C1F9), Color(0xFF3366FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Concluir',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
