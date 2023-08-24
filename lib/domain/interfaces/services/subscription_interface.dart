import 'package:pay_2_me/domain/models/export_models.dart';

abstract class ISubscriptionService {
  Future<GetSubscriptionQuery> search(String token);
  Future<GetSubscriptionQuery> create(CreateSubscriptionCommand command, String token);
  Future<GetSubscriptionQuery> update(UpdateSubscriptionCommand command, String token);
  Future<GetSubscriptionQuery> delete(DeleteSubscriptionCommand command, String token);

  Future<GetSubscriptionQuery> renewed(RenewedSubscriptionCommand command, String token);
  Future<GetSubscriptionQuery> reactivate(ReactivateSubscriptionCommand command, String token);
  Future<GetSubscriptionQuery> pause(PauseSubscriptionCommand command, String token);
  Future<GetSubscriptionQuery> cancel(CancelSubscriptionCommand command, String token);
  Future<GetSubscriptionQuery> finish(FinishSubscriptionCommand command, String token);
  
  Future<bool?> enableRecurrence(EnableRecurrenceSubscriptionCommand command, String token);
  Future<bool?> disableRecurrence(DisableRecurrenceSubscriptionCommand command, String token);
}