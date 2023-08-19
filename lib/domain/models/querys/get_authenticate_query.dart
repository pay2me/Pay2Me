import 'package:pay_2_me/domain/models/export_models.dart';

class GetAuthenticateQuery {
  SetAuthenticateMapper? auth;
  int? code;
  bool? success;

  GetAuthenticateQuery({this.auth});

  GetAuthenticateQuery.MapFromJson(Map<String, dynamic> json) {
    auth = SetAuthenticateMapper.MapFromJson(json);
    code = json.isEmpty ? 200 : 400;
    success = json.isEmpty ? false : true;
  }
}
