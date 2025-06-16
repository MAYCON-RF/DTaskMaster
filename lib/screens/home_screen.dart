/*
  Componente: Home Screen

  Descrição:
  Este arquivo contém a definição do componente home_screen. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/screens/task_card_navegavel.dart';
import 'package:desafio_task_master/screens/task_creation_screen.dart';
import 'package:desafio_task_master/screens/task_finish_screen.dart';
import 'package:desafio_task_master/core/app_theme.dart';

class TaskModel {
  final String title;
  final String date;
  final Color color;
  String description;
  bool isDone;

  TaskModel({
    required this.title,
    required this.date,
    required this.color,
    this.description = '',
    this.isDone = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _tomorrowController = PageController();
  int _tomorrowPage = 0;

  List<TaskModel> todayTasks = [
    TaskModel(
      title: 'Testar fluxo de cadastro com Firebase',
      date: '17 Maio',
      color: Colors.red,
      description: 'Testar se cadastro funciona do início ao fim com Firebase.',
    ),
    TaskModel(
      title: 'Preparar Wireframe para Main Flow',
      date: '17 Maio',
      color: Colors.yellow,
      description: 'Criar o wireframe inicial da jornada principal do app.',
    ),
    TaskModel(
      title: 'Preparar Screens',
      date: '17 Maio',
      color: Colors.green,
      description: 'Finalizar a estrutura visual das telas para entrega.',
    ),
  ];

  List<List<TaskModel>> tomorrowTaskPages = [
    [
      TaskModel(title: 'Refinar microinterações da tela', date: '18 Maio', color: Colors.red),
      TaskModel(title: 'Adicionar animação no ícone', date: '18 Maio', color: Colors.red),
      TaskModel(title: 'Testar responsividade da tela', date: '18 Maio', color: Colors.yellow),
    ],
    [
      TaskModel(title: 'Prototipar a tela de “Resumo ”', date: '18 Maio', color: Colors.yellow),
      TaskModel(title: 'Revisar hierarquia tipográfica', date: '18 Maio', color: Colors.yellow),
      TaskModel(title: 'Rascunho da mensagem de push', date: '18 Maio', color: Colors.green),
    ],
  ];

  List<TaskModel> overdueTasks = [
    TaskModel(title: 'Corrigir bug', date: '4 Abril', color: Colors.red),
    TaskModel(title: 'Implementar validação', date: '14 Maio', color: Colors.yellow),
    TaskModel(title: 'Integrar autenticação', date: '16 Maio', color: Colors.green),
  ];

  Future<void> completeTask(TaskModel task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFinishScreen(
          title: task.title,
          description: task.description,
          date: DateTime.now(),
        ),
      ),
    );

    if (result != null && result['isDone'] == true) {
      setState(() {
        task.isDone = true;
        task.description = result['description'];
      });
    }
  }

  void toggleToday(int index) {
    setState(() {
      final task = todayTasks[index];
      task.isDone = !task.isDone;
    });
  }

  void toggleTomorrow(TaskModel task) {
    setState(() => task.isDone = !task.isDone);
  }

  void toggleOverdue(TaskModel task) {
    setState(() => task.isDone = !task.isDone);
  }

  double get todayProgress {
    final total = todayTasks.length;
    final completed = todayTasks.where((task) => task.isDone).length;
    return total == 0 ? 0 : completed / total;
  }

  @override
  Widget build(BuildContext context) {
    final completed = todayTasks.where((t) => t.isDone).length;
    final total = todayTasks.length;
    final percent = (todayProgress * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Bom dia, Maycon! Você tem tarefas para hoje.',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildTodayOverview(completed, total, percent),
              const SizedBox(height: 24),
              _buildSectionTitle('Minhas tarefas de hoje'),
              ...todayTasks.asMap().entries.map((entry) {
                final i = entry.key;
                final task = entry.value;
                return GestureDetector(
                  onTap: () => completeTask(task),
                  child: TaskCard(
                    title: task.title,
                    date: task.date,
                    color: task.color,
                    isDone: task.isDone,
                    onToggle: () => toggleToday(i),
                  ),
                );
              }).toList(),
              const SizedBox(height: 24),
              _buildSectionTitle('Minhas tarefas de amanhã'),
              _buildTomorrowTasks(),
              _buildSectionTitle('Minhas tarefas Atrasadas'),
              ...overdueTasks.map((task) {
                return GestureDetector(
                  onTap: () => completeTask(task),
                  child: TaskCard(
                    title: task.title,
                    date: task.date,
                    color: task.color,
                    isDone: task.isDone,
                    onToggle: () => toggleOverdue(task),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskCreationScreen(),
            ),
          );
          if (result is TaskModel) {
            setState(() {
              todayTasks.add(result);
            });
          }
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppGradients.button,
            boxShadow: [
              BoxShadow(
                color: AppColors.blueGradientEnd.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTodayOverview(int completed, int total, int percent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tarefa do dia', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('$completed/$total Tarefas Concluídas', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todayProgress == 1.0
                    ? 'Parabéns, continue sempre assim!'
                    : todayProgress == 0.0
                    ? 'Vamos começar? Você consegue!'
                    : 'Você está quase lá, continue assim!',
                style: const TextStyle(color: Colors.grey),
              ),
              Text('$percent%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 14,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F3EFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: todayProgress,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF4DF21), Color(0xFF2A97E4)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTomorrowTasks() {
    return SizedBox(
      height: 330,
      child: PageView.builder(
        controller: _tomorrowController,
        itemCount: tomorrowTaskPages.length,
        onPageChanged: (index) => setState(() => _tomorrowPage = index),
        itemBuilder: (context, pageIndex) {
          return Column(
            children: tomorrowTaskPages[pageIndex].map((task) {
              return GestureDetector(
                onTap: () => completeTask(task),
                child: TaskCard(
                  title: task.title,
                  date: task.date,
                  color: task.color,
                  isDone: task.isDone,
                  onToggle: () => toggleTomorrow(task),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Ver todas', style: TextStyle(color: Colors.blue, fontSize: 14)),
        ],
      ),
    );
  }
}