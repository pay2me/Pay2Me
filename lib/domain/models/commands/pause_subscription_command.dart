class PauseSubscriptionCommand {
  String? subscriptionId;
  DateTime? subscriptionReactiveAt;

  PauseSubscriptionCommand({
    this.subscriptionId,
    this.subscriptionReactiveAt,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
    'reactive_at': subscriptionReactiveAt,
  };
}