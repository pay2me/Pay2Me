class DisableRecurrenceSubscriptionCommand {
  String? subscriptionId;

  DisableRecurrenceSubscriptionCommand({
    this.subscriptionId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
  };
}