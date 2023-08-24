class DeleteProductCommand {
  String? productId;

  DeleteProductCommand({
    this.productId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': productId,
  };
}
