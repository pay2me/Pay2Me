import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';
import 'package:pay_2_me/infra/configs/export_configs.dart';

class AuthenticateService  implements IAuthenticateService {

  @override
  Future<GetAuthenticateQuery> login(String email, String password) async {
    var url = "${Settings.url}/clientUsers/login?email=$email&password=$password";
    var response = await Dio().post(url, options: Options(
      headers: {},
    ));
    var result = response.data;
    return GetAuthenticateQuery.MapFromJson(result);
  }

  @override
  Future<int?> logout(String token) async {
    var url = "${Settings.url}/clientUsers/logout";
    var response = await Dio().post(url, options: Options(
      headers: {
        "authorization": "Bearer ${token}",
      },
    ));
    return response.statusCode;
  }
}