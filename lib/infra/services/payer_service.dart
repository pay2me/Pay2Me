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
    var url = "${Settings.cobreFacilEndPoint}/customers?taxpayer_id=$cpf&ein=$cnpj&email=$email&personal_name=$name&company_name=$companyName&sort_by=$sortBy&order_by=$orderBy&limit=$limit&offset=$offset";
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
    var url = "${Settings.cobreFacilEndPoint}/payers.json";
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
    var url = "${Settings.cobreFacilEndPoint}/payers/${command.payerId}.json";
    var response = await Dio().patch(url,
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
    var url = "${Settings.cobreFacilEndPoint}/payers/${command.payerId}.json";
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
