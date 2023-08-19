import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetCardMapper {
  String? cardId;
  String? cardNumber;
  String? cardPrintedName;
  String? cardCvv;
  DateTime? cardExpiryDate;

  SetCardMapper({
    this.cardId,
    this.cardNumber,
    this.cardPrintedName,
    this.cardCvv,
    this.cardExpiryDate,
  });

  SetCardMapper.MapFromJson(Map<String, dynamic> json) {
    cardId = json['cardId'];
    cardNumber = json['cardNumber'];
    cardPrintedName = json['cardPrintedName'];
    cardCvv = json['cardCvv'];
    cardExpiryDate = DateUtility().stringToDate(json['cardExpiryDate']);
  }

  Map<String, dynamic> jsonFromMap() => {
    'cardId': cardId,
    'cardNumber': cardNumber,
    'cardPrintedName': cardPrintedName,
    'cardCvv': cardCvv,
    'cardExpiryDate': cardExpiryDate,
  };
}
