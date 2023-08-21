import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IProductService {
  Future<GetProductQuery> search(
    String token, 
    {
      String? status,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  );

  Future<bool?> create(CreateProductCommand command, String token);
  Future<bool?> update(UpdateProductCommand command, String token);
  Future<bool?> delete(DeleteProductCommand command, String token);
  
  Future<bool?> active(String serviceId, String token);
  Future<bool?> inactive(String serviceId, String token);
}