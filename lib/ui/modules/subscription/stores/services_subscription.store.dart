import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/business/subscription_business.dart';
import 'package:pay_2_me/ui/modules/index/stores/main_index.store.dart';

part 'services_subscription.store.g.dart';

class ServicesSubscriptionStore = _ServicesSubscriptionStore with _$ServicesSubscriptionStore;

abstract class _ServicesSubscriptionStore with Store, ChangeNotifier {
  //  Business

  final subscriptionBusiness = SubscriptionBusiness();

  // GETS

  Future<List<SetSubscriptionMapper>> searchSubscriptions(BuildContext context,) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    return (await subscriptionBusiness.search(token)) ?? [];
  }

  // CRUD

  Future<String?> createSubscription(BuildContext context, SetSubscriptionMapper subscription) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    CreateSubscriptionCommand createSubscriptionCommand = CreateSubscriptionCommand(
      subscriptionPayerId: subscription.subscriptionPayerId,
      subscriptionExpiresAt: subscription.subscriptionExpiresAt,
      subscriptionFirstDueDate: subscription.subscriptionFirstDueDate,
      subscriptionGenerateDays: subscription.subscriptionGenerateDays,
      subscriptionIntervalType: subscription.subscriptionIntervalType,
      subscriptionIntervalSize: subscription.subscriptionIntervalSize,
      subscriptionItems: subscription.subscriptionItems,
      subscriptionNotificationRuleId: subscription.subscriptionNotificationRuleId,
      subscriptionPayableWith: subscription.subscriptionPayableWith,
      subscriptionReference: subscription.subscriptionReference,
      subscriptionSettings: subscription.subscriptionSettings,
    );

    return (await subscriptionBusiness.create(createSubscriptionCommand, token));
  }

  Future<String?> updateSubscription(BuildContext context, SetSubscriptionMapper subscription) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    UpdateSubscriptionCommand updateSubscriptionCommand = UpdateSubscriptionCommand(
      subscriptionId: subscription.subscriptionId,
      subscriptionPayerId: subscription.subscriptionPayerId,
      subscriptionExpiresAt: subscription.subscriptionExpiresAt,
      subscriptionFirstDueDate: subscription.subscriptionFirstDueDate,
      subscriptionGenerateDays: subscription.subscriptionGenerateDays,
      subscriptionIntervalType: subscription.subscriptionIntervalType,
      subscriptionIntervalSize: subscription.subscriptionIntervalSize,
      subscriptionItems: subscription.subscriptionItems,
      subscriptionNotificationRuleId: subscription.subscriptionNotificationRuleId,
      subscriptionPayableWith: subscription.subscriptionPayableWith,
      subscriptionReference: subscription.subscriptionReference,
      subscriptionSettings: subscription.subscriptionSettings,
    );

    return (await subscriptionBusiness.update(updateSubscriptionCommand, token));
  }

  Future<String?> deleteSubscription(BuildContext context, SetSubscriptionMapper subscription) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    DeleteSubscriptionCommand deleteSubscriptionCommand = DeleteSubscriptionCommand(
      subscriptionId: subscription.subscriptionId,
    );

    return (await subscriptionBusiness.delete(deleteSubscriptionCommand, token));
  }
}
