class DeleteSubscriptionItemCommand {
  String? subscriptionServiceId;

  DeleteSubscriptionItemCommand({
    this.subscriptionServiceId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionServiceId,
  };
}