class CreateCardCommand {
  String? cardPayerId;
  num? cardIsDefault;
  String? cardCardHolder;
  String? cardNumber;
  String? cardExpirationYear;
  String? cardExpirationMonth;
  String? cardSecurityCode;

  CreateCardCommand({
    this.cardPayerId,
    this.cardIsDefault,
    this.cardCardHolder,
    this.cardNumber,
    this.cardExpirationYear,
    this.cardExpirationMonth,
    this.cardSecurityCode,
  });

  Map<String, dynamic> MapToJson() => {
    'customer_id': cardPayerId,
    'default': 1,
    'name': cardCardHolder,
    'number': cardNumber,
    'expiration_year': cardExpirationYear,
    'expiration_month': cardExpirationMonth,
    'security_ode': cardSecurityCode,
  };
}