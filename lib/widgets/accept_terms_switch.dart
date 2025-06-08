import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

class AcceptTermsSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const AcceptTermsSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: AppColors.primaryLight, // cor gradiente clara
          activeColor: AppColors.primary,     // cor gradiente escura
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.subtitle,
              children: [
                const TextSpan(text: 'Ao criar uma conta, você aceita nossos '),
                TextSpan(
                  text: 'termos e condições',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                ),
                const TextSpan(text: ' e nossa '),
                TextSpan(
                  text: 'política de privacidade',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),

        ),
      ],
    );
  }
}
