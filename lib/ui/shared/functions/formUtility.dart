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

  String? validate(String fieldName, String? value, bool fieldCanBeNull) {
    if((value == null || value.isEmpty) && fieldCanBeNull) return null;

    bool isValid = true;

    value = value??"";
    bool isDoubleParsed = double.tryParse(value) != null ? true : false;
    bool hasUpperCase = StringUtility().hasUpperCase(value);
    bool hasLowerCase = StringUtility().hasLowerCase(value);
    bool hasNumber = StringUtility().hasNumber(value);
    bool checkLenght = (value.length > 8);
    bool hasSpecialCharacters = StringUtility().hasSpecialCharacters(value);

    switch (fieldName) {
      case "Nome":
        isValid = value.isNotEmpty;
        break;
      case "Telefone":
        isValid = value.isNotEmpty;
        break;
      case "CPF":
        isValid = value.isNotEmpty;
        break;
      case "Cidade":
        isValid = value.isNotEmpty;
        break;
      case "Estado":
        isValid = value.isNotEmpty;
        break;
      case "Bairro":
        isValid = value.isNotEmpty;
        break;
      case "CEP":
        isValid = value.isNotEmpty;
        break;
      case "Número do cartão":
        isValid = value.isNotEmpty;
        break;
      case "Nome no cartão":
        isValid = value.isNotEmpty;
        break;
      case "Data de vencimento":
        isValid = value.isNotEmpty;
        break;
      case "CVV":
        isValid = value.isNotEmpty;
        break;
      case "Serviço":
        isValid = value.isNotEmpty;
        break;
      case "Frequência de pagamento":
        isValid = value.isNotEmpty;
        break;
      case "Valor":
        isValid = value.isNotEmpty;
        break;
      case "Vencimento":
        isValid = value.isNotEmpty;
        break;
      case "Vencimento do plano":
        isValid = value.isNotEmpty;
        break;
      default:
        break;
    }

    return isValid ? null : fieldsAndErrorMessage[fieldName];
  }

}