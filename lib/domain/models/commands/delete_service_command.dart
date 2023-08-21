class DeleteServiceCommand {
  String? serviceId;

  DeleteServiceCommand({
    this.serviceId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': serviceId,
  };
}
