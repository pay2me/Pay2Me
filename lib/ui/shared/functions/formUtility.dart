import 'package:pay_2_me/ui/shared/functions/stringUtility.dart';

class FormUtility {

  Map<String, String> fieldsAndErrorMessage = {
    "Nome": "Nome é obrigatório",
    "Telefone": "Telefone é obrigatório",
    "CPF": "CPF é obrigatório",
    "Cidade": "Cidade é obrigatório",
    "Estado": "Estado é obrigatório",
    "Bairro": "Bairro é obrigatório",
    "CEP": "CEP é obrigatório",
    "Descrição do endereço": "Descrição do endereço do endereço é obrigatório",
    "Rua": "Rua é obrigatório",
    "Número da casa": "Número da casa é obrigatório e deve ser um número válido",
    "Número do cartão": "Número do cartão é obrigatório",
    "Nome no cartão": "Nome no cartão é obrigatório",
    "Mês de vencimento": "Mês de vencimento é obrigatório e deve ser um número válido",
    "Ano de vencimento": "Ano de vencimento é obrigatório e deve ser um número válido",
    "CVV": "CVV é obrigatório e deve ser um número válido",
    "Serviço": "Serviço é obrigatório",
    "Frequência de pagamento": "Frequência de pagamento é obrigatório e deve ser um número válido.\nExemplo: 6 (a cobraça será semestral)",
    "Valor": "Valor é obrigatório e deve ser um número válido",
    "Vencimento da primerira parcela": "Vencimento da primerira parcela é obrigatório",
  };

  bool stringIsNotEmpty(String? value) => (value??"").isNotEmpty;
  bool listIsNotEmpty(List? value) => (value??[]).isNotEmpty;
  bool isNumberParsed(String value) => num.tryParse(value) != null ? true : false;
  bool hasUpperCase(String value) => StringUtility().hasUpperCase(value);
  bool hasLowerCase(String value) => StringUtility().hasLowerCase(value);
  bool hasNumber(String value) => StringUtility().hasNumber(value);
  bool hasSpecialCharacters(String value) => StringUtility().hasSpecialCharacters(value);
  bool checkStringLenght(String value, int minLenght, {int? maxLenght}) => (value.length >= (minLenght)) && (maxLenght == null ? true : value.length <= (maxLenght));
  bool checkListLenght(List value, int minLenght, {int? maxLenght}) => value.length >= (minLenght) && (maxLenght == null ? true : value.length <= (maxLenght));

  String? validate(String fieldName, dynamic value, bool fieldCanBeNull) {
    if((value == null || value.isEmpty) && fieldCanBeNull) return null;

    bool isValid = true;

    switch (fieldName) {
      case "Nome":
        isValid = stringIsNotEmpty(value);
        break;
      case "Telefone":
        isValid = stringIsNotEmpty(value);
        break;
      case "CPF":
        isValid = stringIsNotEmpty(value);
        break;
      case "Cidade":
        isValid = stringIsNotEmpty(value);
        break;
      case "Estado":
        isValid = stringIsNotEmpty(value);
        break;
      case "Bairro":
        isValid = stringIsNotEmpty(value);
        break;
      case "CEP":
        isValid = stringIsNotEmpty(value);
        break;
      case "Descrição do endereço":
        isValid = stringIsNotEmpty(value);
        break;
      case "Rua":
        isValid = stringIsNotEmpty(value);
        break;
      case "Número da casa":
        isValid = stringIsNotEmpty(value) && isNumberParsed(value);
        break;
      case "Número do cartão":
        isValid = stringIsNotEmpty(value);
        break;
      case "Nome no cartão":
        isValid = stringIsNotEmpty(value);
        break;
      case "Mês de vencimento":
        isValid = stringIsNotEmpty(value) && isNumberParsed(value);
        break;
      case "Ano de vencimento":
        isValid = stringIsNotEmpty(value) && isNumberParsed(value);
        break;
      case "CVV":
        isValid = stringIsNotEmpty(value) && isNumberParsed(value);
        break;
      case "Serviço":
        isValid = stringIsNotEmpty(value);
        break;
      case "Frequência de pagamento":
        isValid = stringIsNotEmpty(value) && isNumberParsed(value);
        break;
      case "Valor":
        isValid = stringIsNotEmpty(value) && isNumberParsed(value);
        break;
      case "Vencimento da primerira parcela":
        isValid = stringIsNotEmpty(value);
        break;
      default:
        break;
    }

    return isValid ? null : fieldsAndErrorMessage[fieldName];
  }

}