
# DesafioTaskMaster – Organizador de Tarefas com Integração Google

## 📋 Descrição

O **DesafioTaskMaster** é um aplicativo mobile desenvolvido em **Flutter** com o objetivo de ajudar os usuários a organizarem suas tarefas diárias de forma eficiente, prática e visual. O app oferece um onboarding intuitivo, autenticação simplificada e funcionalidades como foco, lembrete, prioridade e integração com o Google Calendar.

## 📸 Preview do Projeto

<div align="center">
  <img src="assets/preview_onboarding.png" alt="Onboarding" width="250"/>
  <img src="assets/preview_home.png" alt="Tela Principal" width="250"/>
</div>

## ✅ Funcionalidades

1. **Onboarding Interativo**
   - Fluxo com 4 etapas que apresentam os recursos do app.
   - Ilustrações temáticas e navegação por swipe.

2. **Login e Cadastro**
   - Autenticação com e-mail e senha.
   - Login com Google e Facebook.

3. **Gestão de Tarefas**
   - Criação de tarefas com título, descrição, data e hora.
   - Definição de prioridade e lembrete.
   - Marcação de tarefas como concluídas.

4. **Foco e Produtividade**
   - Tela de “modo foco” com visual minimalista.
   - Cronômetro de atividade (em desenvolvimento).

5. **Integração com Google Calendar**
   - Sincronização de tarefas agendadas com o calendário do usuário.

## 🛠️ Tecnologias Utilizadas

- **Framework:** Flutter 3+
- **Linguagem:** Dart
- **Gerenciamento de Estado:** Stateful Widgets
- **Persistência:** SharedPreferences
- **Estilização:** Custom Theme (`app_theme.dart`)
- **Integrações:** Google Sign-In (em progresso)

## 🧪 Estrutura do Projeto

```
lib/
├── core/                # Estilo e dimensões globais
│   ├── app_theme.dart
│   └── app_dimens.dart
├── models/              # Modelos de dados
│   └── onboarding_model.dart
├── screens/             # Telas do app
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── onboarding_page.dart
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   └── task_creation_screen.dart
├── widgets/             # Componentes reutilizáveis
│   ├── gradient_button.dart
│   ├── page_indicator.dart
│   ├── password_text_field.dart
│   └── social_login_button.dart
├── controller/          # Lógica das telas
│   ├── login_controller.dart
│   └── splash_controller.dart
├── services/            # Serviços auxiliares
│   ├── storage_service.dart
│   └── fake_code_validator.dart
└── main.dart            # Ponto de entrada
```

## ▶️ Como Executar o Projeto

### 1. Requisitos
- Flutter 3.10 ou superior instalado
- Dispositivo/emulador Android ou iOS

### 2. Instalar Dependências
```bash
flutter pub get
```

### 3. Executar o App
```bash
flutter run
```

> Obs: para rodar com login Google, será necessário configurar SHA-1, OAuth e o arquivo `google-services.json`.

## 👨‍💻 Exemplo de Uso

- Visualização do onboarding na primeira execução.
- Cadastro de novo usuário com e-mail.
- Criação de tarefa com prioridade e lembrete.
- Visualização da lista de tarefas.
- Marcar tarefa como concluída.
- Integração com Google Calendar (em breve).

## 🎯 Público-Alvo

Pessoas que desejam organizar tarefas com um app leve, rápido e moderno. Ideal para profissionais, estudantes ou usuários com rotina dinâmica.

## 👤 Autor

Desenvolvido por **Maycon Rodrigues** – [LinkedIn](https://www.linkedin.com/in/maycon-rodrigues)

## 📄 Licença

Este projeto está licenciado sob a **MIT License**.
