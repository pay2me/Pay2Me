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

  Future<GetProductQuery> create(CreateProductCommand command, String token);
  Future<GetProductQuery> update(UpdateProductCommand command, String token);
  Future<GetProductQuery> delete(DeleteProductCommand command, String token);
  
  Future<GetProductQuery> active(String serviceId, String token);
  Future<GetProductQuery> inactive(String serviceId, String token);
}