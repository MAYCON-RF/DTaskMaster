/*
  Componente: Description Input

  Descrição:
  Este arquivo contém a definição do componente description_input. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/



import 'package:flutter/material.dart';

class DescriptionInputField extends StatefulWidget {
  final String initialText;
  final ValueChanged<String>? onChanged;

  const DescriptionInputField({
    super.key,
    required this.initialText,
    this.onChanged,
  });

  @override
  State<DescriptionInputField> createState() => _DescriptionInputFieldState();
}

class _DescriptionInputFieldState extends State<DescriptionInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 4,
      minLines: 2,
      style: const TextStyle(color: Colors.white),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Adicione uma descrição...',
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF1C1C1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
