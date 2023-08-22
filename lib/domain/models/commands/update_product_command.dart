class UpdateProductCommand {
  String? productId;
  String? productDescription;
  num? productFixedPrice;
  num? productPrice;
  String? productStatus;

  UpdateProductCommand({
    this.productId,
    this.productDescription,
    this.productFixedPrice,
    this.productPrice,
    this.productStatus,
  });

  Map<String, dynamic> MapToJson() => {
    'id': productId,
    'description': productDescription,
    'fixedPrice': productFixedPrice,
    'price': productPrice,
    'status': productStatus,
  };
}
