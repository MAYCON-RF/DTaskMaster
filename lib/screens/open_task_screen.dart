/*
  Componente: Open Task Screen

  Descrição:
  Este arquivo contém a definição do componente open_task_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:desafio_task_master/screens/focus_mode_screen.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/widgets/date_selector_gradient.dart';
import 'package:desafio_task_master/widgets/reminder_time_picker.dart';

class TaskDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final DateTime date;

  const TaskDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _descController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

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

                const Text('Agenda', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(widget.description, style: const TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 24),

                const Text('Ligar Lembrete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ReminderTimePicker(
                  initialTime: selectedTime,
                  onTimeChanged: (newTime) {
                    setState(() {
                      selectedTime = newTime;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Icon(Icons.notifications_active_outlined, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text('Receber alerta para esta tarefa?', style: TextStyle(color: Colors.white)),
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const FocusModeScreen()),
                          );
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
                              child: Text('Iniciar Tarefa', style: TextStyle(color: Colors.white, fontSize: 16)),
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
        },
      ),
    );
  }
}