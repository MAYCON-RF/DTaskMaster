/*
  Componente: Reminder Time Picker

  Descrição:
  Este arquivo contém a definição do componente reminder_time_picker. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

class ReminderTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const ReminderTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeChanged,
  });

  @override
  State<ReminderTimePicker> createState() => _ReminderTimePickerState();
}

class _ReminderTimePickerState extends State<ReminderTimePicker> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
  }

  Future<void> _showCustomTimePicker(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.surface,
              hourMinuteTextColor: AppColors.textPrimary,
              hourMinuteColor: Colors.transparent,
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              dialHandColor: AppColors.blueGradientEnd,
              dialBackgroundColor: AppColors.background,
              dialTextColor: AppColors.textPrimary,
              entryModeIconColor: AppColors.textSecondary,
              helpTextStyle: const TextStyle(color: Colors.white60),
              dayPeriodTextColor: AppColors.textPrimary,
              dayPeriodColor: Colors.transparent,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCustomTimePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.borderDark),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.access_time_rounded, color: AppColors.blueGradientEnd),
            const SizedBox(width: 12),
            Text(
              selectedTime.format(context),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
