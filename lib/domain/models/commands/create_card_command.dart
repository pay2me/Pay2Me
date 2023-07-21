class CreateCardCommand {
  String? cardNumber;
  String? cardCvv;
  String? cardPrintedName;
  String? cardHolderCpf;
  String? cardBillingAddress;

  CreateCardCommand({
    this.cardNumber,
    this.cardCvv,
    this.cardPrintedName,
    this.cardHolderCpf,
    this.cardBillingAddress,
  });

  Map<String, dynamic> MapToJson() => {
    'cardNumber': cardNumber,
    'cardCvv': cardCvv,
    'cardPrintedName': cardPrintedName,
    'cardHolderCpf': cardHolderCpf,
    'cardBillingAddress': cardBillingAddress,
  };
}