class UpdateSubscriptionItemCommand {
  String? serviceId;
  num? quantity;
  num? price;

  UpdateSubscriptionItemCommand({
    this.serviceId,
    this.quantity,
    this.price,
  });

  Map<String, dynamic> MapToJson() => {
    'id': serviceId,
    'quantity': quantity,
    'price': price,
  };
}
