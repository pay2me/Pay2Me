import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IPayerService {
  Future<GetPayerQuery> getAll(String token);
  Future<GetPayerQuery> getForId(int id, String token);
  Future<GetPayerQuery> getForName(String name, String token);
  Future<int?> insert(CreatePayerCommand command, String token);
  Future<int?> update(UpdatePayerCommand command, String token);
  Future<int?> delete(DeletePayerCommand command, String token);
}