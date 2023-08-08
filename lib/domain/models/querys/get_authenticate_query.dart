import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetAuthenticateQuery {
  SetAuthenticateMapper? auth;
  int? code;
  bool? success;

  GetAuthenticateQuery({this.auth});

  GetAuthenticateQuery.MapFromJson(Map<String, dynamic> json) {
    auth = SetAuthenticateMapper(
      authName: json['authName'],
      authEmail: json['authEmail'],
      authRole: json['authRole'],
      authToken: json['authToken'],
    );
  }

  GetAuthenticateQuery.MapFromResponse(Response response) {
    auth = SetAuthenticateMapper.MapFromJson(response.data);
    code = response.statusCode;
    success = response.statusMessage=="OK"?true:false;
  }
}
