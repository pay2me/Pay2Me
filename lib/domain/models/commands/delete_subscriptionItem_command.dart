class DeleteSubscriptionItemCommand {
  String? subscriptionProductId;

  DeleteSubscriptionItemCommand({
    this.subscriptionProductId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionProductId,
  };
}