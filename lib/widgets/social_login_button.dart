/*
  Componente: Botão de Login Social

  Este botão exibe o ícone de uma rede social ao lado de um texto, permitindo login com plataformas externas.
  Ideal para autenticação com Google, Facebook, entre outros.

  Parâmetros:
  - iconPath: caminho da imagem do ícone da rede social
  - text: texto exibido no botão (ex: "Entrar com Google")
  - onTap: função executada ao pressionar o botão
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';


// Componente visual sem estado para login social
class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,

      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: const BorderSide(color: AppColors.borderDark),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          // Ícone da rede social
          Image.asset(
            iconPath,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),


          // Texto do botão alinhado à esquerda
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.social,
            ),
          ),
        ],
      ),
    );
  }
}
