class CreateServiceCommand {
  String? serviceDescription;
  num? serviceFixedPrice;
  num? servicePrice;
  String? serviceStatus;

  CreateServiceCommand({
    this.serviceDescription,
    this.serviceFixedPrice,
    this.servicePrice,
    this.serviceStatus,
  });

  Map<String, dynamic> MapToJson() => {
    'description': serviceDescription,
    'fixedPrice': serviceFixedPrice,
    'price': servicePrice,
    'status': serviceStatus,
  };
}
