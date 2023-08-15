class SetCardMapper {
  String? cardId;
  String? cardNumber;
  String? cardPrintedName;
  String? cardCvv;
  String? cardExpiryDate;

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
    cardExpiryDate = json['cardExpiryDate'];
  }

  Map<String, dynamic> jsonFromMap() => {
    'cardId': cardId,
    'cardNumber': cardNumber,
    'cardPrintedName': cardPrintedName,
    'cardCvv': cardCvv,
    'cardExpiryDate': cardExpiryDate,
  };
}
