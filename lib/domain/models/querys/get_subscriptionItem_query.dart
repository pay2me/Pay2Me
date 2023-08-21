import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetSetSubscriptionItemMapperQuery {
  List<SetSubscriptionItemMapper>? payers;
  int? code;
  bool? success;

  GetSetSubscriptionItemMapperQuery({this.payers, this.success, this.code});

  GetSetSubscriptionItemMapperQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    payers = data.map((i) => SetSubscriptionItemMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage == "OK" ? true : false;
  }
}
