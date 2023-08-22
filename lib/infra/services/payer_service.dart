import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';
import 'package:pay_2_me/infra/configs/export_configs.dart';

class PayerService implements IPayerService {
  @override
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
  ) async {
    final List<String> queryParams = [];
    if (cpf != null) {
      queryParams.add("taxpayer_id=$cpf");
    }
    if (cnpj != null) {
      queryParams.add("ein=$cnpj");
    }
    if (email != null) {
      queryParams.add("email=$email");
    }
    if (name != null) {
      queryParams.add("personal_name=$name");
    }
    if (companyName != null) {
      queryParams.add("company_name=$companyName");
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
    final String url = "${Settings.cobreFacilEndPoint}/customers?$queryString";
    var response = await Dio().get(url,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetPayerQuery.MapFromResponse(response);
  }

  @override
  Future<bool?> create(CreatePayerCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/customers";
    var response = await Dio().post(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result != null;
  }

  @override
  Future<bool?> update(UpdatePayerCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/customers/${command.payerId}";
    var response = await Dio().put(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result != null;
  }

  @override
  Future<bool?> delete(DeletePayerCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/customers/${command.payerId}";
    var response = await Dio().delete(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result == null;
  }
}
