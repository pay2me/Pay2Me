import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IPayerService {
  Future<GetPayerQuery> getAll(String token);
  Future<String?> insert(CreatePayerCommand command, String token);
  Future<SetPayerMapper?> update(UpdatePayerCommand command, String token);
  Future<bool?> delete(DeletePayerCommand command, String token);
}