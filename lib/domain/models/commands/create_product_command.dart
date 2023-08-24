class CreateProductCommand {
  String? productDescription;
  num? productPrice;
  String? productStatus;

  CreateProductCommand({
    this.productDescription,
    this.productPrice,
    this.productStatus,
  });

  Map<String, dynamic> MapToJson() => {
        'description': productDescription,
        'price': productPrice,
        'status': productStatus,
      };
}
