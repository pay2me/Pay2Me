import 'package:pay_2_me/domain/models/mapper/set_subscriptionItem_mapper.dart';
import 'package:pay_2_me/domain/models/mapper/set_subscription_mapper.dart';

class UpdateSubscriptionCommand {
  String? subscriptionId;
  String? subscriptionPayerId;
  String? subscriptionExpiresAt;
  String? subscriptionFirstDueDate;
  String? subscriptionGenerateDays;
  String? subscriptionIntervalType;
  String? subscriptionIntervalSize;
  List<SetSubscriptionItemMapper>? subscriptionItems;
  String? subscriptionNotificationRuleId;
  String? subscriptionPayableWith;
  String? subscriptionReference;
  SubscriptionSettings? subscriptionSettings;

  UpdateSubscriptionCommand({
    this.subscriptionId,
    this.subscriptionPayerId,
    this.subscriptionExpiresAt,
    this.subscriptionFirstDueDate,
    this.subscriptionGenerateDays,
    this.subscriptionIntervalType,
    this.subscriptionIntervalSize,
    this.subscriptionItems,
    this.subscriptionNotificationRuleId,
    this.subscriptionPayableWith,
    this.subscriptionReference,
    this.subscriptionSettings,
  });

  Map<String, dynamic> MapToJson() => {
    'id': subscriptionId,
    'payer_id': subscriptionPayerId,
    'expires_at': subscriptionExpiresAt,
    'first_due_date': subscriptionFirstDueDate,
    'generate_days': subscriptionGenerateDays,
    'interval_type': subscriptionIntervalType,
    'interval_size': subscriptionIntervalSize,
    'items': (subscriptionItems??[]).map((item) => item.jsonFromMap()),
    'notificationruleid': subscriptionNotificationRuleId,
    'payablewith': subscriptionPayableWith,
    'reference': subscriptionReference,
    'settings': subscriptionSettings,
  };
}
