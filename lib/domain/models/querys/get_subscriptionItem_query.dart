import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetSetSubscriptionItemMapperQuery {
  List<SetSubscriptionItemMapper>? subscriptionItems;
  int? code;
  bool? success;

  GetSetSubscriptionItemMapperQuery({this.subscriptionItems, this.success, this.code});

  GetSetSubscriptionItemMapperQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    subscriptionItems = data.map((i) => SetSubscriptionItemMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage == "OK" ? true : false;
  }
}
