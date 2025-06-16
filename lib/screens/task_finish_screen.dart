/*
  Componente: Task Finish Screen

  Descrição:
  Este arquivo contém a definição do componente task_finish_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:desafio_task_master/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/widgets/date_selector_gradient.dart';

class TaskFinishScreen extends StatefulWidget {
  final String title;
  final String description;
  final DateTime date;

  const TaskFinishScreen({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  State<TaskFinishScreen> createState() => _TaskFinishScreenState();
}

class _TaskFinishScreenState extends State<TaskFinishScreen> {
  bool alertEnabled = true;

  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descController.text = widget.description;
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            DateSelector(selectedDate: selectedDate),
            const SizedBox(height: 16),

            const Text('Subtarefa:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _descController,
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Digite observações da tarefa...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF1C1C1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
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
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Seletor de arquivos
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.upload_file, color: Colors.white, size: 28),
                      SizedBox(height: 8),
                      Text('Clique para enviar', style: TextStyle(color: Colors.blueAccent)),
                      Text('JPG, PDF, TXT com menos de 10MB', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                ),
              ),
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
                      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (route) => false,
    );
                    },
                    child: const Text(
                      'Concluir Tarefa',
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
      ),
    );
  }
}
