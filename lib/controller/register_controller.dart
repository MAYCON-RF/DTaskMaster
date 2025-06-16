/*
  Controlador de Cadastro - Etapa 2

  Este controller gerencia a lógica da segunda etapa do cadastro, incluindo:
  - Validação de código de verificação
  - Controle de campos de texto (código e data)
  - Armazenamento da data selecionada
*/


// Importações dos pacotes
import 'package:flutter/material.dart';
import '../services/fake_code_validator.dart';


// Controller simples utilizado na tela de verificação de código e data
class RegisterController {
  // Lista de controladores para os campos de código (5 dígitos)
  final List<TextEditingController> codeControllers =
  List.generate(5, (_) => TextEditingController());

  // Controlador para o campo de data
  final TextEditingController dateController = TextEditingController();

  // Cor da borda do campo de código (indicador visual de validade)
  Color codeBorderColor = Colors.grey;

  // Data selecionada pelo usuário (pode ser usada em validações futuras)
  DateTime? selectedDate;


  // Valida o código digitado usando um serviço fake e ajusta a cor da borda
  bool validateCode(String code) {
    final isValid = FakeCodeValidator.validate(code);
    codeBorderColor = isValid ? Colors.green : Colors.redAccent;
    return isValid;
  }


  // Libera todos os controladores quando o controller for descartado
  void dispose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    dateController.dispose();
  }
}
