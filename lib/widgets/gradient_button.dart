/*
  Componente: Botão com Gradiente e Animação

  Este botão customizado aplica um gradiente horizontal e uma leve animação de escala ao passar o mouse.
  Ideal para ações principais em telas de login, cadastro, onboarding, etc.

  Parâmetros:
  - text: rótulo exibido no botão
  - onTap: função a ser executada ao clicar
  - width: largura opcional do botão
  - height: altura opcional do botão
*/

// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

// Componente com estado para controlar efeito de hover (desktop/web)
class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: widget.onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: widget.width ?? MediaQuery.of(context).size.width * 0.5,
            ),
            child: Container(
              height: widget.height,
              padding: widget.height == null
                  ? const EdgeInsets.symmetric(horizontal: 40, vertical: 14)
                  : null,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppGradients.button,
                borderRadius: BorderRadius.circular(30),
                boxShadow: _hovering
                    ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ]
                    : [],
              ),
              child: Text(
                widget.text,
                style: AppTextStyles.button,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
