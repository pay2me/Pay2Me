import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IServiceService {
  Future<GetServiceQuery> search(
    String token, 
    {
      String? status,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  );

  Future<bool?> create(CreateServiceCommand command, String token);
  Future<bool?> update(UpdateServiceCommand command, String token);
  Future<bool?> delete(DeleteServiceCommand command, String token);
}