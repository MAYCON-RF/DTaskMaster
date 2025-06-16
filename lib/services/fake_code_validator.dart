/*
  Validação de Código ficticio

  Esta classe simula a verificação de um código de autenticação.
  Utilizada apenas para fins de teste durante o desenvolvimento.

  Regras:
  - O único código válido é '12345'
*/


// Classe utilitária para validação simples de código
class FakeCodeValidator {
  static const String validCode = '12345';


  // Verifica se o código informado é igual ao código válido
  static bool validate(String inputCode) {
    return inputCode == validCode;
  }
}
