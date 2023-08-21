class DeleteProductCommand {
  String? serviceId;

  DeleteProductCommand({
    this.serviceId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': serviceId,
  };
}
