import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';
import 'package:pay_2_me/infra/configs/export_configs.dart';

class ProductService implements IProductService {
  @override
  Future<GetProductQuery> search(
    String token, 
    {
      String? status,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  ) async {
    final List<String> queryParams = [];
    if (status != null) {
      queryParams.add("status=$status");
    }
    if (sortBy != null) {
      queryParams.add("sort_by=$sortBy");
    }
    if (orderBy != null) {
      queryParams.add("order_by=$orderBy");
    }
    if (limit != null) {
      queryParams.add("limit=$limit");
    }
    if (offset != null) {
      queryParams.add("offset=$offset");
    }

    final String queryString = queryParams.join('&');
    var url = "${Settings.cobreFacilEndPoint}/product-services?$queryString";
    var response = await Dio().get(url,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetProductQuery.MapFromResponse(response);
  }

  @override
  Future<GetProductQuery> create(CreateProductCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/product-services";
    var response = await Dio().post(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetProductQuery.MapFromResponse(response);
  }

  @override
  Future<GetProductQuery> update(UpdateProductCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/product-services/${command.productId}";
    var response = await Dio().put(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetProductQuery.MapFromResponse(response);
  }

  @override
  Future<GetProductQuery> delete(DeleteProductCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/product-services/${command.productId}";
    var response = await Dio().delete(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetProductQuery.MapFromResponse(response);
  }
  
  @override
  Future<GetProductQuery> active(String serviceId, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/product-services/$serviceId/activate";
    var response = await Dio().delete(url,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetProductQuery.MapFromResponse(response);
  }
  
  @override
  Future<GetProductQuery> inactive(String serviceId, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/product-services/$serviceId/inactivate";
    var response = await Dio().delete(url,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetProductQuery.MapFromResponse(response);
  }
}
