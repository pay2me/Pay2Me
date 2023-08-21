class CreateCardCommand {
  String? cardPayerId;
  String? cardIsDefault;
  String? cardName;
  String? cardNumber;
  String? cardExpirationYear;
  String? cardExpirationMonth;
  String? cardSecurityCode;

  CreateCardCommand({
    this.cardPayerId,
    this.cardIsDefault,
    this.cardName,
    this.cardNumber,
    this.cardExpirationYear,
    this.cardExpirationMonth,
    this.cardSecurityCode,
  });

  Map<String, dynamic> MapToJson() => {
    'CUSTOMER_id': cardPayerId,
    'default': cardIsDefault,
    'name': cardName,
    'number': cardNumber,
    'expiration_year': cardExpirationYear,
    'expiration_month': cardExpirationMonth,
    'security_ode': cardSecurityCode,
  };
}