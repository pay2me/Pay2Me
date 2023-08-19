import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';
import 'package:pay_2_me/infra/configs/export_configs.dart';

class PayerService implements IPayerService {

  @override
  Future<GetPayerQuery> getAll(String token) async {
    var url = "${Settings.cobreFacilEndPoint}/payers.json";
    var response = await Dio().get(url, options: Options(
      headers: {
        "authorization": "Bearer $token",
      },
    ));
    var result = response.data;
    return GetPayerQuery.MapFromResponse(result);
  }

  @override
  Future<GetPayerQuery> getFromId(String token, String id) async {
    var url = "${Settings.cobreFacilEndPoint}/payers/$id.json";
    var response = await Dio().get(url, options: Options(
      headers: {
        "authorization": "Bearer $token",
      },
    ));
    var result = response.data;
    return GetPayerQuery.MapFromResponse(result);
  }
  
  @override
  Future<bool?> insert(CreatePayerCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/payers.json";
    var response = await Dio().post(url, data: command.MapToJson(), options: Options(
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
    var response = await Dio().patch(url, data: command.MapToJson(), options: Options(
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
    var response = await Dio().delete(url, data: command.MapToJson(), options: Options(
      headers: {
        "authorization": "Bearer $token",
      },
    ));
    var result = response.data;
    return result == null;
  }
}