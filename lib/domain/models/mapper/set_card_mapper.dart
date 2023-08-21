import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetCardMapper {
  String? cardPayerId;
  String? cardId;
  String? cardNumber;
  String? cardPrintedName;
  String? cardCvv;
  String? cardExpirationMonth;
  String? cardExpirationYear;

  SetCardMapper({
    this.cardPayerId,
    this.cardId,
    this.cardNumber,
    this.cardPrintedName,
    this.cardCvv,
    this.cardExpirationMonth,
    this.cardExpirationYear,
  });

  SetCardMapper.MapFromJson(Map<String, dynamic> json) {
    cardPayerId = json['customer_id'];
    cardId = json['id'];
    cardNumber = json['number'];
    cardPrintedName = json['name'];
    cardCvv = json['security_code'];
    cardExpirationMonth = json['expiration_month'];
    cardExpirationYear = json['expiration_year'];
  }

  Map<String, dynamic> jsonFromMap() => {
        'customer_id': cardPayerId,
        'cardId': cardId,
        'cardNumber': cardNumber,
        'cardPrintedName': cardPrintedName,
        'cardCvv': cardCvv,
        'expiration_month': cardExpirationMonth,
        'expiration_year': cardExpirationYear,
      };
}
