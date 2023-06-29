import 'package:pay_2_me/domain/models/export_models.dart';

class GetPayerQuery {
  List<SetPayerMapper>? cards;
  int? code;
  bool? success;

  GetPayerQuery({this.cards, this.success, this.code});

  GetPayerQuery.MapFromJson(Map<String, dynamic> json) {
    Iterable result = json['result'];
    cards = result.map((i) => SetPayerMapper.MapFromJson(i)).toList();
    code = json['code'];
    success = json['success'];
  }
}
