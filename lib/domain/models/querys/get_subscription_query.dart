import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetSubscriptionQuery {
  List<SetSubscriptionMapper>? payers;
  int? code;
  bool? success;

  GetSubscriptionQuery({this.payers, this.success, this.code});

  GetSubscriptionQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    payers = data.map((i) => SetSubscriptionMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage == "OK" ? true : false;
  }
}
