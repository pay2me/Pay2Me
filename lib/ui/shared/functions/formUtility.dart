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
    "Número do cartão": "Número do cartão é obrigatório",
    "Nome no cartão": "Nome no cartão é obrigatório",
    "Data de vencimento": "Data de vencimento é obrigatório",
    "CVV": "CVV é obrigatório",
    "Serviço": "Serviço é obrigatório",
    "Frequência de pagamento": "Frequência de pagamento é obrigatório",
    "Valor": "Valor é obrigatório",
    "Vencimento": "Vencimento é obrigatório",
    "Vencimento do plano": "Vencimento do plano é obrigatório",
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
      case "Número do cartão":
        isValid = stringIsNotEmpty(value);
        break;
      case "Nome no cartão":
        isValid = stringIsNotEmpty(value);
        break;
      case "Data de vencimento":
        isValid = stringIsNotEmpty(value);
        break;
      case "CVV":
        isValid = stringIsNotEmpty(value);
        break;
      case "Serviço":
        isValid = stringIsNotEmpty(value);
        break;
      case "Frequência de pagamento":
        isValid = stringIsNotEmpty(value);
        break;
      case "Valor":
        isValid = stringIsNotEmpty(value);
        break;
      case "Vencimento":
        isValid = stringIsNotEmpty(value);
        break;
      case "Vencimento do plano":
        isValid = stringIsNotEmpty(value);
        break;
      default:
        break;
    }

    return isValid ? null : fieldsAndErrorMessage[fieldName];
  }

}