class UpdateCardCommand {
  String? cardId;
  String? cardNumber;
  String? cardCvv;
  String? cardPrintedName;
  String? cardHolderCpf;
  String? cardBillingAddress;

  UpdateCardCommand({
    this.cardId,
    this.cardNumber,
    this.cardCvv,
    this.cardPrintedName,
    this.cardHolderCpf,
    this.cardBillingAddress,
  });

  Map<String, dynamic> MapToJson() => {
    'cardId': cardId,
    'cardNumber': cardNumber,
    'cardCvv': cardCvv,
    'cardPrintedName': cardPrintedName,
    'cardHolderCpf': cardHolderCpf,
    'cardBillingAddress': cardBillingAddress,
  };
}