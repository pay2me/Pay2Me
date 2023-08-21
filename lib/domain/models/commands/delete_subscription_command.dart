class DeleteSubscriptionCommand {
  String? subscriptionId;

  DeleteSubscriptionCommand({
    this.subscriptionId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
  };
}