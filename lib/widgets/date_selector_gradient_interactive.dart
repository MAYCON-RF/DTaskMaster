/*
  Componente: Date Selector Gradient Interactive

  Descrição:
  Este arquivo contém a definição do componente date_selector_gradient_interactive. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectorGradientInteractive extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DateSelectorGradientInteractive({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final days = List.generate(7, (index) => today.subtract(Duration(days: 3 - index)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        final isSelected = day.day == selectedDate.day &&
            day.month == selectedDate.month &&
            day.year == selectedDate.year;

        final weekday = DateFormat.E('pt_BR').format(day);
        final weekdayFormatted = weekday[0].toUpperCase() + weekday.substring(1, 3).toLowerCase();

        return Expanded(
          child: GestureDetector(
            onTap: () => onDateSelected(day),
            child: Column(
              children: [
                const SizedBox(height: 4),
                Container(
                  width: 54,
                  height: 72,
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [Color(0xFF53C1F9), Color(0xFF3366FF)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                    color: isSelected ? null : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : Colors.white24,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weekdayFormatted,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${day.day}",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
