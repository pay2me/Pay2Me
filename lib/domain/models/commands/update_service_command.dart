class UpdateServiceCommand {
  String? serviceId;
  String? serviceDescription;
  num? serviceFixedPrice;
  num? servicePrice;
  String? serviceStatus;

  UpdateServiceCommand({
    this.serviceId,
    this.serviceDescription,
    this.serviceFixedPrice,
    this.servicePrice,
    this.serviceStatus,
  });

  Map<String, dynamic> MapToJson() => {
    'id': serviceId,
    'description': serviceDescription,
    'fixedPrice': serviceFixedPrice,
    'price': servicePrice,
    'status': serviceStatus,
  };
}
