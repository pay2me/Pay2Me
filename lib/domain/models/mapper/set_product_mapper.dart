import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetProductMapper {
  String? productId;
  String? productDescription;
  num? productFixedPrice;
  num? productPrice;
  String? productStatus;
  DateTime? productCreateAt;
  DateTime? productUpdateAt;

  SetProductMapper({
    this.productId,
    this.productDescription,
    this.productFixedPrice,
    this.productPrice,
    this.productStatus,
    this.productCreateAt,
    this.productUpdateAt,
  });

  SetProductMapper.MapFromJson(Map<String, dynamic> json) {
    print(json);
    productId = json['id'];
    productDescription = json['description'];
    productFixedPrice = json['fixed_price'];
    productPrice = num.tryParse(json['price'].toString());
    productStatus = json['status'];
    productCreateAt = DateUtility().stringToDate(json['created_at']);
    productUpdateAt = DateUtility().stringToDate(json['updated_at']);
  }

  Map<String, dynamic> mapToFilter() {
    return {
      "id": productId,
      "name": productDescription ?? "",
    };
  }
}
