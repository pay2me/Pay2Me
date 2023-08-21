import 'package:pay_2_me/domain/models/export_models.dart';

abstract class ISubscriptionService {
  Future<GetSubscriptionQuery> search(String token);
  Future<bool?> create(CreateSubscriptionCommand command, String token);
  Future<bool?> update(UpdateSubscriptionCommand command, String token);
  Future<bool?> delete(DeleteSubscriptionCommand command, String token);

  Future<bool?> renewed(RenewedSubscriptionCommand command, String token);
  Future<bool?> reactivate(ReactivateSubscriptionCommand command, String token);
  Future<bool?> pause(PauseSubscriptionCommand command, String token);
  Future<bool?> cancel(CancelSubscriptionCommand command, String token);
  Future<bool?> finish(FinishSubscriptionCommand command, String token);
  
  Future<bool?> enableRecurrence(EnableRecurrenceSubscriptionCommand command, String token);
  Future<bool?> disableRecurrence(DisableRecurrenceSubscriptionCommand command, String token);
}