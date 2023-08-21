class ReactivateSubscriptionCommand {
  String? subscriptionId;
  DateTime? subscriptionNextExpiration;
  DateTime? subscriptionExpirationAt;

  ReactivateSubscriptionCommand({
    this.subscriptionId,
    this.subscriptionNextExpiration,
    this.subscriptionExpirationAt,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
    'next_expiration': subscriptionNextExpiration,
    'expiration_at': subscriptionExpirationAt,
  };
}