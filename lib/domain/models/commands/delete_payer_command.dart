class DeletePayerCommand {
  String? payerId;

  DeletePayerCommand({
    this.payerId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': payerId,
  };
}
