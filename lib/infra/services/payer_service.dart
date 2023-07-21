import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';
import 'package:pay_2_me/infra/configs/export_configs.dart';

class PayerService  implements IPayerService {

  @override
  Future<GetPayerQuery> getAll(String token) async {
    var url = "${Settings.url}/payers/payerList";
    var response = await Dio().get(url, options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    var result = response.data;
    return GetPayerQuery.MapFromJson(result);
  }

  @override
  Future<GetPayerQuery> getForId(int id, String token) async {
    var url = "${Settings.url}/payers/payerForId?id=$id";
    var response = await Dio().get(url, options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    var result = response.data;
    return GetPayerQuery.MapFromJson(result);
  }

  @override
  Future<GetPayerQuery> getForName(String name, String token) async {
    var url = "${Settings.url}/payers/payerForName?name=$name";
    var response = await Dio().get(url, options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    var result = response.data;
    return GetPayerQuery.MapFromJson(result);
  }
  
  @override
  Future<int?> insert(CreatePayerCommand command, String token) async {
    var url = "${Settings.url}/payers/create";
    var response = await Dio().post(url, data: command.MapToJson(), options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    var result = response.data;

    return result['code'];
  }

  @override
  Future<int?> update(UpdatePayerCommand command, String token) async {
    var url = "${Settings.url}/payers/update";
    var response = await Dio().put(url, data: command.MapToJson(), options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    var result = response.data;

    return result['code'];
  }

  @override
  Future<int?> delete(DeletePayerCommand command, String token) async {
    var url = "${Settings.url}/payers/delete";
    var response = await Dio().delete(url, data: command.MapToJson(), options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    var result = response.data;

    return result['code'];
  }
}