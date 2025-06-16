/*
  Componente: Date Selector Gradient

  Descrição:
  Este arquivo contém a definição do componente date_selector_gradient. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  final DateTime selectedDate;

  const DateSelector({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final days = List.generate(7, (index) => today.subtract(Duration(days: 3 - index)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        final isToday = day.day == today.day &&
            day.month == today.month &&
            day.year == today.year;

        final weekday = DateFormat.E('pt_BR').format(day);
        final weekdayFormatted = weekday[0].toUpperCase() + weekday.substring(1, 3).toLowerCase();

        return Expanded(
          child: Column(
            children: [
              const SizedBox(height: 4),
              Container(
                width: 54,
                height: 72,
                decoration: BoxDecoration(
                  gradient: isToday
                      ? const LinearGradient(
                    colors: [Color(0xFF53C1F9), Color(0xFF3366FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                      : null,
                  borderRadius: BorderRadius.circular(16),
                  color: isToday ? null : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekdayFormatted,
                      style: TextStyle(
                        color: isToday ? Colors.white : Colors.grey[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('d').format(day),
                      style: TextStyle(
                        color: isToday ? Colors.white : Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isToday)
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Icon(Icons.circle, size: 6, color: Colors.white),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        );
      }).toList(),
    );
  }
}
