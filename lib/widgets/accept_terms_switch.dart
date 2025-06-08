import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

class AcceptTermsSwitch extends StatefulWidget {
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
  State<AcceptTermsSwitch> createState() => _AcceptTermsSwitchState();
}

class _AcceptTermsSwitchState extends State<AcceptTermsSwitch> {
  late TapGestureRecognizer _termsRecognizer;
  late TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()..onTap = widget.onTermsTap;
    _privacyRecognizer = TapGestureRecognizer()..onTap = widget.onPrivacyTap;
  }

  @override
  void didUpdateWidget(covariant AcceptTermsSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _termsRecognizer.onTap = widget.onTermsTap;
    _privacyRecognizer.onTap = widget.onPrivacyTap;
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(
          value: widget.value,
          onChanged: widget.onChanged,
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
                  recognizer: _termsRecognizer,
                ),
                const TextSpan(text: ' e nossa '),
                TextSpan(
                  text: 'política de privacidade',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: _privacyRecognizer,
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
