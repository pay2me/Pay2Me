class EnableRecurrenceSubscriptionCommand {
  String? subscriptionId;

  EnableRecurrenceSubscriptionCommand({
    this.subscriptionId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
  };
}