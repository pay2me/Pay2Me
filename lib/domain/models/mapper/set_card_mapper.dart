import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetCardMapper {
  String? cardId;
  String? cardPayerId;
  String? cardIsDefault;
  String? cardBrand;
  String? cardFirst6Digits;
  String? cardLast4Digits;
  String? cardExpirationYear;
  String? cardExpirationMonth;
  DateTime? cardCreateAt;
  DateTime? cardUpdateAt;
  DateTime? cardDeleteAt;

  SetCardMapper({
    this.cardId,
    this.cardPayerId,
    this.cardIsDefault,
    this.cardBrand,
    this.cardFirst6Digits,
    this.cardLast4Digits,
    this.cardExpirationYear,
    this.cardExpirationMonth,
    this.cardCreateAt,
    this.cardUpdateAt,
    this.cardDeleteAt,
  });

  SetCardMapper.MapFromJson(Map<String, dynamic> json) {
    cardId = json['id'];
    cardPayerId = json['customer_id'];
    cardIsDefault = json['default'];
    cardBrand = json['brand'];
    cardFirst6Digits = json['first6_digits'];
    cardLast4Digits = json['last4_digits'];
    cardExpirationYear = json['expiration_year'];
    cardExpirationMonth = json['expiration_month'];
    cardCreateAt = DateUtility().stringToDate(json['createat']);
    cardUpdateAt = DateUtility().stringToDate(json['updateat']);
    cardDeleteAt = DateUtility().stringToDate(json['deleteat']);
  }
}
