/*
  Componente: Task Completed Screen

  Descrição:
  Este arquivo contém a definição do componente task_completed_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/widgets/date_selector_gradient.dart';
import 'package:desafio_task_master/widgets/reminder_time_picker.dart';

class TaskCompletedScreen extends StatefulWidget {
  final String title;
  final String description;
  final DateTime date;

  const TaskCompletedScreen({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  State<TaskCompletedScreen> createState() => _TaskCompletedScreenState();
}

class _TaskCompletedScreenState extends State<TaskCompletedScreen> {
  bool alertEnabled = true;
  TimeOfDay selectedTime = const TimeOfDay(hour: 6, minute: 0);

  @override
  Widget build(BuildContext context) {
    final selectedDate = widget.date;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title, style: const TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                DateSelector(selectedDate: selectedDate),
                const SizedBox(height: 16),

                const Text('Subtarefa:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(widget.title, style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16),

                const Text('Anotações:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(widget.description, style: const TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 16),

                const Text('Arquivos:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('01 Arquivo', style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline)),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.insert_drive_file, color: Colors.white),
                ),
                const SizedBox(height: 24),

                Row(
                  children: [
                    const Icon(Icons.send_to_mobile_outlined, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text('Enviar para o Google Calendar', style: TextStyle(color: Colors.white)),
                    ),
                    Switch(
                      value: alertEnabled,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) => setState(() => alertEnabled = val),
                    ),
                  ],
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          backgroundColor: const Color(0xFF6E6BF1),
                        ),
                        onPressed: () {
                          // ação ao reabrir tarefa
                        },
                        child: const Text(
                          'Reabrir tarefa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
