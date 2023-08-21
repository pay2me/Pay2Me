import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetProductQuery {
  List<SetProductMapper>? payers;
  int? code;
  bool? success;

  GetProductQuery({this.payers, this.success, this.code});

  GetProductQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    payers = data.map((i) => SetProductMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage == "OK" ? true : false;
  }
}
