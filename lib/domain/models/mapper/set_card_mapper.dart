class SetCardMapper {
  String? cardId;
  String? cardNumber;
  String? cardCvv;
  String? cardPrintedName;
  String? cardHolderCpf;
  String? cardBillingAddress;

  SetCardMapper({
    this.cardId,
    this.cardNumber,
    this.cardCvv,
    this.cardPrintedName,
    this.cardHolderCpf,
    this.cardBillingAddress,
  });

  SetCardMapper.MapFromJson(Map<String, dynamic> json) {
    cardId = json['cardId'];
    cardNumber = json['cardNumber'];
    cardCvv = json['cardCvv'];
    cardPrintedName = json['cardPrintedName'];
    cardHolderCpf = json['cardHolderCpf'];
    cardBillingAddress = json['cardBillingAddress'];
  }

  Map<String, dynamic> jsonFromMap() => {
    'cardId': cardId,
    'cardNumber': cardNumber,
    'cardCvv': cardCvv,
    'cardPrintedName': cardPrintedName,
    'cardHolderCpf': cardHolderCpf,
    'cardBillingAddress': cardBillingAddress,
  };
}
