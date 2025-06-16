/*
  Tela de Cadastro - Etapa 2

  Esta tela representa a segunda etapa do fluxo de cadastro.
  Permite ao usuário inserir dados pessoais (nome, data de nascimento, telefone),
  e validar um código de verificação recebido por e-mail.

  Componentes:
  - Campos de texto para nome, data de nascimento e telefone
  - Campo para digitação de código com validação visual
  - Seleção de data com calendário nativo
  - Botão para continuar
  - Link de retorno ao login
*/

// Importações dos pacotes
import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';
import '../widgets/gradient_button.dart';
import '../screens/login_screen.dart';
import '../widgets/back_button_widget.dart';
import '../services/fake_code_validator.dart';

// Tela com estado, utilizada para controle de inputs, código e data
class RegisterStep2Screen extends StatefulWidget {
  const RegisterStep2Screen({super.key});

  @override
  State<RegisterStep2Screen> createState() => _RegisterStep2ScreenState();
}

class _RegisterStep2ScreenState extends State<RegisterStep2Screen> {
  final _codeControllers = List.generate(5, (_) => TextEditingController());
  Color _codeBorderColor = AppColors.codeDefault;

  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  // Validação de código com feedback visual de sucesso/erro
  void _validateCode() {
    final typedCode = _codeControllers.map((c) => c.text).join();
    setState(() {
      if (FakeCodeValidator.validate(typedCode)) {
        _codeBorderColor = AppColors.codeValid;
      } else {
        _codeBorderColor = AppColors.codeInvalid;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fieldWidth = size.width * 0.85;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            // Imagem ilustrativa superior
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/image_register2.png',
                fit: BoxFit.contain,
              ),
            ),

            // Área com formulário
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      // Botão de voltar
                      const BackButtonWidget(currentPage: 0, useGradientStyle: true),
                      const SizedBox(height: 16),

                      // Campo: Nome completo
                      _buildTextField(Icons.person_outline, 'Nome completo', fieldWidth),
                      const SizedBox(height: 16),

                      // Campo: Data de nascimento
                      _buildDateField('Data de Nascimento', fieldWidth),
                      const SizedBox(height: 16),

                      // Campo: Telefone
                      _buildTextField(Icons.phone_outlined, 'Número de telefone', fieldWidth),
                      const SizedBox(height: 24),

                      // Título do bloco de código
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite o código',
                          style: AppTextStyles.title.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryLogin,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Instrução explicativa
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Por favor, informe o código recebido no seu e-mail de cadastro, para redefinir a senha:',
                          style: AppTextStyles.subtitle.copyWith(
                            fontSize: 14,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Campo de código com 5 dígitos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return SizedBox(
                            width: 48,
                            child: TextField(
                              controller: _codeControllers[index],
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _validateCode(),
                              style: AppTextStyles.subtitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDark,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _codeBorderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _codeBorderColor, width: 2),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 28),

                      // ✅ Botão para continuar — agora redireciona para Login
                      GradientButton(
                        text: 'Continuar Cadastro',
                        width: 220,
                        height: 50,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                                (route) => false,
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Link para login
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (route) => false,
                          );
                        },
                        child: const Text(
                          'Já tenho uma conta!',
                          style: AppTextStyles.link,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar: campo de texto genérico
  Widget _buildTextField(IconData icon, String label, double width) {
    return SizedBox(
      width: width,
      child: TextField(
        style: AppTextStyles.subtitle.copyWith(color: AppColors.textDark),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(icon, color: AppColors.textDark),
          filled: true,
          fillColor: AppColors.boxPassword,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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

  // Widget auxiliar: campo de data com interação de calendário
  Widget _buildDateField(String label, double width) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: _dateController,
        onTap: _pickDate,
        keyboardType: TextInputType.datetime,
        onChanged: (value) {
          if (value.length == 10) {
            final parts = value.split('/');
            if (parts.length == 3) {
              try {
                final date = DateTime(
                  int.parse(parts[2]),
                  int.parse(parts[1]),
                  int.parse(parts[0]),
                );
                setState(() {
                  _selectedDate = date;
                  _dateController.text = _formatDate(date);
                });
              } catch (_) {}
            }
          }
        },
        style: AppTextStyles.subtitle.copyWith(color: AppColors.textDark),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: const Icon(Icons.calendar_today_outlined, color: AppColors.textDark),
          filled: true,
          fillColor: AppColors.boxPassword,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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

  // Função auxiliar: abre o seletor de datas e atualiza o estado
  void _pickDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'Selecione sua data de nascimento',
      confirmText: 'Confirmar',
      cancelText: 'Cancelar',
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryLogin,
              onPrimary: Colors.white,
              onSurface: AppColors.textDark,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryLogin,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formatDate(picked);
      });
    }
  }

  // Formata a data para o formato br (dd/MM/yyyy)
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }
}
