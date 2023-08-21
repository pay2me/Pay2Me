import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetServiceQuery {
  List<SetServiceMapper>? payers;
  int? code;
  bool? success;

  GetServiceQuery({this.payers, this.success, this.code});

  GetServiceQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    payers = data.map((i) => SetServiceMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage == "OK" ? true : false;
  }
}
