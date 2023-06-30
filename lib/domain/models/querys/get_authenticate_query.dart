import 'package:pay_2_me/domain/models/export_models.dart';

class GetAuthenticateQuery {
  SetAuthenticateMapper? auth;

  GetAuthenticateQuery({this.auth});

  GetAuthenticateQuery.MapFromJson(Map<String, dynamic> json) {
    auth = SetAuthenticateMapper(
      authName: json['authName'],
      authEmail: json['authEmail'],
      authRole: json['authRole'],
      authToken: json['authToken'],
    );
  }
}
