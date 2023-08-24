class CreateSubscriptionItemCommand {
  String? productId;
  num? quantity;
  num? price;

  CreateSubscriptionItemCommand({
    this.productId,
    this.quantity,
    this.price,
  });

  Map<String, dynamic> MapToJson() => {
    'products_products_id': productId,
    'quantity': quantity,
    'price': price,
  };
}