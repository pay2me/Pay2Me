import 'package:pay_2_me/domain/models/export_models.dart';

class GetPayerQuery {
  List<SetPayerMapper>? payers;
  int? code;
  bool? success;

  GetPayerQuery({this.payers, this.success, this.code});

  GetPayerQuery.MapFromJson(Map<String, dynamic> json) {
    Iterable result = json['result'];
    payers = result.map((i) => SetPayerMapper.MapFromJson(i)).toList();
    code = json['code'];
    success = json['success'];
  }
}
