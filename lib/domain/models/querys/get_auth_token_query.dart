import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/mapper/set_auth_token_mapper.dart';

class GetAuthTokenQuery {
  SetAuthTokenMapper? authToken;
  int? code;
  bool? success;

  GetAuthTokenQuery({this.authToken, this.success, this.code});

  GetAuthTokenQuery.MapFromResponse(Response response) {
    authToken = SetAuthTokenMapper.MapFromJson(response.data["data"]);
    code = response.statusCode;
    success = response.data["success"];
  }
}
