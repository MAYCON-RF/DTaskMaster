/*
  Componente: Task Creation Screen

  Descrição:
  Este arquivo contém a definição do componente task_creation_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';
import 'package:desafio_task_master/widgets/gradient_button.dart';
import 'package:desafio_task_master/widgets/date_selector_gradient_interactive.dart';
import 'package:intl/intl.dart';
import 'package:desafio_task_master/models/task_model.dart';


class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({super.key});

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  int _selectedPriority = 1;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  TimeOfDay _startTime = const TimeOfDay(hour: 18, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 21, minute: 0);
  bool _sendToGoogleCalendar = false;
  DateTime _selectedDate = DateTime.now();
  bool alertEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Criação de Nova Tarefa", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateSelectorGradientInteractive(
                  selectedDate: _selectedDate,
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 24),

                const Text("Agenda", style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 8),
                TextField(
                  controller: _titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Nome da Tarefa",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _descController,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Adicione informações importantes sobre esta tarefa",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Prioridade", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _priorityButton("Alta", 0, AppGradients.highPriority, Color(0xFFF5272A)),
                    _priorityButton("Média", 1, AppGradients.mediumPriority, Color(0xFFF0DE15)),
                    _priorityButton("Baixa", 2, AppGradients.lowPriority, Color(0xFF8BC34A)),
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
                      child: GradientButton(
                        text: "Criar Nova Tarefa",
                        onTap: () {
                          Navigator.pop(context);
                        },
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

  Widget _priorityButton(String label, int value, LinearGradient gradient, Color borderColor) {
    final isSelected = _selectedPriority == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPriority = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            gradient: isSelected ? gradient : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: isSelected
                ? null
                : Border.all(color: borderColor, width: 1.5),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isSelected ? Colors.black : borderColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _timePickerTile(String label, TimeOfDay time, Function(TimeOfDay?) onPicked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: time,
            );
            onPicked(picked);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              time.format(context),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        GradientButton(
          text: 'Criar Tarefa',
          onTap: () {
            final novaTarefa = TaskModel(
              title: _titleController.text,
              date: DateFormat('dd MMMM', 'pt_BR').format(_selectedDate),
              color: Colors.green,
              description: _descController.text,
            );
            Navigator.pop(context, novaTarefa);
          },
        ),

      ],
    );
  }
}
