import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetPayerQuery {
  List<SetPayerMapper>? payers;
  int? code;
  bool? success;

  GetPayerQuery({this.payers, this.success, this.code});

  GetPayerQuery.MapFromResponse(Response response) {
    Iterable data = response.data;
    payers = data.map((i) => SetPayerMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage=="OK"?true:false;
  }
}
