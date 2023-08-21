class FinishSubscriptionCommand {
  String? subscriptionId;

  FinishSubscriptionCommand({
    this.subscriptionId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
  };
}