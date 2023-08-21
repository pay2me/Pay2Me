import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetServiceMapper {
  String? serviceId;
  String? serviceDescription;
  num? serviceFixedPrice;
  num? servicePrice;
  String? serviceStatus;
  DateTime? serviceCreateAt;
  DateTime? serviceUpdateAt;

  SetServiceMapper({
    this.serviceId,
    this.serviceDescription,
    this.serviceFixedPrice,
    this.servicePrice,
    this.serviceStatus,
    this.serviceCreateAt,
    this.serviceUpdateAt,
  });

  SetServiceMapper.MapFromJson(Map<String, dynamic> json) {
    serviceId= json['id'];
    serviceDescription= json['description'];
    serviceFixedPrice= json['fixedprice'];
    servicePrice= json['price'];
    serviceStatus= json['status'];
    serviceCreateAt= DateUtility().stringToDate(json['create_at']);
    serviceUpdateAt= DateUtility().stringToDate(json['update_at']);
  }
}
