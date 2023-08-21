import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetProductMapper {
  String? serviceId;
  String? serviceDescription;
  num? serviceFixedPrice;
  num? servicePrice;
  String? serviceStatus;
  DateTime? serviceCreateAt;
  DateTime? serviceUpdateAt;

  SetProductMapper({
    this.serviceId,
    this.serviceDescription,
    this.serviceFixedPrice,
    this.servicePrice,
    this.serviceStatus,
    this.serviceCreateAt,
    this.serviceUpdateAt,
  });

  SetProductMapper.MapFromJson(Map<String, dynamic> json) {
    serviceId= json['id'];
    serviceDescription= json['description'];
    serviceFixedPrice= json['fixedprice'];
    servicePrice= json['price'];
    serviceStatus= json['status'];
    serviceCreateAt= DateUtility().stringToDate(json['create_at']);
    serviceUpdateAt= DateUtility().stringToDate(json['update_at']);
  }
}
