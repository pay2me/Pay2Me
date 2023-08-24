class CancelSubscriptionCommand {
  String? subscriptionId;

  CancelSubscriptionCommand({
    this.subscriptionId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
  };
}