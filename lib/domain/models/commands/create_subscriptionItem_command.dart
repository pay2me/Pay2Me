class CreateSubscriptionItemCommand {
  String? serviceId;
  num? quantity;
  num? price;

  CreateSubscriptionItemCommand({
    this.serviceId,
    this.quantity,
    this.price,
  });

  Map<String, dynamic> MapToJson() => {
    'products_services_id': serviceId,
    'quantity': quantity,
    'price': price,
  };
}