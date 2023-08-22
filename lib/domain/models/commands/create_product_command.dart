class CreateProductCommand {
  String? productDescription;
  num? productFixedPrice;
  num? productPrice;
  String? productStatus;

  CreateProductCommand({
    this.productDescription,
    this.productFixedPrice,
    this.productPrice,
    this.productStatus,
  });

  Map<String, dynamic> MapToJson() => {
    'description': productDescription,
    'fixedPrice': productFixedPrice,
    'price': productPrice,
    'status': productStatus,
  };
}
