/*
  Componente: Aceite de Termos com Switch

  Este widget combina um botão de alternância (Switch) com um texto interativo que apresenta os
  termos e a política de privacidade. Ideal para ser utilizado em telas de cadastro.

  Parâmetros:
  - value: estado atual do switch (ativado ou não)
  - onChanged: callback para alteração do switch
  - onTermsTap: ação ao clicar em "termos e condições"
  - onPrivacyTap: ação ao clicar em "política de privacidade"
*/


// Importações dos pacotes
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';


// Widget sem estado, utilizado para exibir termos com interação e switch
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


        // Botão de alternância para aceite dos termos
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: AppColors.blueGradientStart.withAlpha(120), // fundo azul claro translúcido
          activeColor: AppColors.blueGradientEnd, // botão azul escuro
          inactiveTrackColor: AppColors.borderLight.withAlpha(100),
          inactiveThumbColor: AppColors.textDark,
        ),


        // Texto explicativo com links interativos para termos e política
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
