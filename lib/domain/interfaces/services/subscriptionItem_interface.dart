import 'package:pay_2_me/domain/models/export_models.dart';

abstract class ISubscriptionItem {

  Future<GetSetSubscriptionItemMapperQuery?> search(String token);
  Future<bool?> create(CreateSubscriptionItemCommand command, String token);
  Future<bool?> update(UpdateSubscriptionItemCommand command, String token);
  Future<bool?> delete(DeleteSubscriptionItemCommand command, String token);
}