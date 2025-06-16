/*
  Componente: Campo de Senha com Ícone de Visibilidade

  Este widget exibe um campo de texto para senhas, com a opção de mostrar ou ocultar o conteúdo.
  Inclui ícones personalizados e estilo padronizado conforme o tema do app.

  Parâmetros:
  - label: texto que identifica o campo
  - width: largura definida para o campo
  - controller: controlador opcional do campo de texto
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';


// Widget com estado, necessário para alternar a visibilidade da senha
class PasswordTextField extends StatefulWidget {
  final String label;
  final double width;
  final TextEditingController? controller;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.width,
    this.controller,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}


class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: AppTextStyles.subtitle.copyWith(color: AppColors.textDark),

        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.label,
          labelStyle: AppTextStyles.subtitle.copyWith(
            color: AppColors.textSubtitle,
          ),

          // Ícone de cadeado no lado esquerdo
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Icon(Icons.lock_outline, color: AppColors.textDark),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),

          // Botão para alternar a visibilidade da senha
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.textDark,
            ),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),

          // Estilo visual do campo
          filled: true,
          fillColor: AppColors.boxPassword,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.blueGradientEnd, width: 2),
          ),
        ),
      ),
    );
  }
}
