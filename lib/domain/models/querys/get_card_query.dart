import 'package:dio/dio.dart';
import 'package:pay_2_me/domain/models/export_models.dart';

class GetCardQuery {
  List<SetCardMapper>? cards;
  int? code;
  bool? success;

  GetCardQuery({this.cards, this.success, this.code});

  GetCardQuery.MapFromResponse(Response response) {
    Iterable data = response.data["data"];
    cards = data.map((i) => SetCardMapper.MapFromJson(i)).toList();
    code = response.statusCode;
    success = response.statusMessage=="OK"?true:false;
  }
}
