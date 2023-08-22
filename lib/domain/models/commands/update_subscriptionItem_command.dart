class UpdateSubscriptionItemCommand {
  String? productId;
  num? quantity;
  num? price;

  UpdateSubscriptionItemCommand({
    this.productId,
    this.quantity,
    this.price,
  });

  Map<String, dynamic> MapToJson() => {
    'id': productId,
    'quantity': quantity,
    'price': price,
  };
}
