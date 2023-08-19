import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetServiceMapper {
  String? serviceName;
  String? serviceValue;
  String? serviceFrequency;
  DateTime? serviceExpirationPlanDate;
  DateTime? serviceSubscriptionExpirationDate;

  SetServiceMapper({
    this.serviceName,
    this.serviceValue,
    this.serviceFrequency,
    this.serviceExpirationPlanDate,
    this.serviceSubscriptionExpirationDate,
  });

  SetServiceMapper.MapFromJson(Map<String, dynamic> json) {
    serviceName = json['serviceName'];
    serviceValue = json['serviceValue'];
    serviceFrequency = json['serviceFrequency'];
    serviceExpirationPlanDate = DateUtility().stringToDate(json['serviceExpirationPlanDate']);
    serviceSubscriptionExpirationDate = DateUtility().stringToDate(json['serviceSubscriptionExpirationDate']);
  }

  Map<String, dynamic> jsonFromMap() => {
    'serviceName': serviceName,
    'serviceValue': serviceValue,
    'serviceFrequency': serviceFrequency,
    'serviceExpirationPlanDate': serviceExpirationPlanDate,
    'serviceSubscriptionExpirationDate': serviceSubscriptionExpirationDate,
  };
}
