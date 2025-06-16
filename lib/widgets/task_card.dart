/*
  Componente: Task Card

  Descrição:
  Este arquivo contém a definição do componente task_card. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/



import 'package:flutter/material.dart';
import 'package:desafio_task_master/screens/open_task_screen.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final Color color;
  final bool isDone;
  final VoidCallback onToggle;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.color,
    required this.isDone,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.6), width: 1.5),
      ),
      child: Row(
        children: [
          // Barra lateral
          Container(
            width: 8,
            height: 90,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Conteúdo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(date,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Check à direita
          GestureDetector(
            onTap: onToggle,
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
                color: isDone ? Colors.white : Colors.transparent,
                boxShadow: isDone
                    ? [
                  BoxShadow(
                    color: color.withOpacity(0.35),
                    blurRadius: 4,
                    spreadRadius: 0.5,
                  )
                ]
                    : [],
              ),
              child: isDone
                  ? const Icon(Icons.check, size: 16, color: Colors.black)
                  : null,
            ),
          ),
        ],
      ),
    );

    return !isDone
        ? GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TaskDetailScreen(
              title: title,
              description: 'Descrição da tarefa ainda não iniciada...',
              date: DateTime.now(),
            ),
          ),
        );
      },
      child: cardContent,
    )
        : cardContent;
  }
}
