import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetSubscriptionQuery {
  List<SetSubscriptionMapper>? subscriptions;
  int? code;
  bool? success;

  GetSubscriptionQuery({this.subscriptions, this.success, this.code});

  GetSubscriptionQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    subscriptions = data.map((i) => SetSubscriptionMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage == "OK" ? true : false;
  }
}
