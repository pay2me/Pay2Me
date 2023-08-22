import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IPayerService {
  Future<GetPayerQuery> search(
    String token, 
    {
      String? cpf, 
      String? cnpj, 
      String? email, 
      String? name,
      String? companyName,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  );

  Future<GetPayerQuery> create(CreatePayerCommand command, String token);
  Future<GetPayerQuery> update(UpdatePayerCommand command, String token);
  Future<GetPayerQuery> delete(DeletePayerCommand command, String token);
}