import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetCardMapper {
  String? cardId;
  String? cardPayerId;
  num? cardIsDefault;
  String? cardCardHolder;
  String? cardBrand;
  String? cardNumber;
  String? cardFirst6Digits;
  String? cardLast4Digits;
  String? cardExpirationYear;
  String? cardExpirationMonth;
  String? cardSecurityCode;
  DateTime? cardCreateAt;
  DateTime? cardUpdateAt;
  DateTime? cardDeleteAt;

  SetCardMapper({
    this.cardId,
    this.cardPayerId,
    this.cardIsDefault,
    this.cardCardHolder,
    this.cardBrand,
    this.cardNumber,
    this.cardFirst6Digits,
    this.cardLast4Digits,
    this.cardExpirationYear,
    this.cardExpirationMonth,
    this.cardSecurityCode,
    this.cardCreateAt,
    this.cardUpdateAt,
    this.cardDeleteAt,
  });

  SetCardMapper.MapFromJson(Map<String, dynamic> json) {
    cardId = json['id'];
    cardPayerId = json['customer_id'];
    cardIsDefault = json['default'];
    cardCardHolder = json['name'];
    cardBrand = json['brand'];
    cardNumber = json['number'];
    cardFirst6Digits = json['first6_digits'];
    cardLast4Digits = json['last4_digits'];
    cardExpirationYear = json['expiration_year'];
    cardExpirationMonth = json['expiration_month'];
    cardSecurityCode = json['expiration_month'];
    cardCreateAt = DateUtility().stringToDate(json['createat']);
    cardUpdateAt = DateUtility().stringToDate(json['updateat']);
    cardDeleteAt = DateUtility().stringToDate(json['deleteat']);
  }
}
