import 'package:pay_2_me/domain/models/export_models.dart';

class GetCardQuery {
  List<SetCardMapper>? cards;
  int? code;
  bool? success;

  GetCardQuery({this.cards, this.success, this.code});

  GetCardQuery.MapFromJson(Map<String, dynamic> json) {
    Iterable result = json['result'];
    cards = result.map((i) => SetCardMapper.MapFromJson(i)).toList();
    code = json['code'];
    success = json['success'];
  }
}
