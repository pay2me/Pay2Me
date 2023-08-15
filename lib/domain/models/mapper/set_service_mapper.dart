class SetServiceMapper {
  String? serviceName;
  String? serviceValue;
  String? serviceFrequency;
  String? serviceExpirationPlanDate;
  String? serviceSubscriptionExpirationDate;

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
    serviceExpirationPlanDate = json['serviceExpirationPlanDate'];
    serviceSubscriptionExpirationDate = json['serviceSubscriptionExpirationDate'];
  }

  Map<String, dynamic> jsonFromMap() => {
    'serviceName': serviceName,
    'serviceValue': serviceValue,
    'serviceFrequency': serviceFrequency,
    'serviceExpirationPlanDate': serviceExpirationPlanDate,
    'serviceSubscriptionExpirationDate': serviceSubscriptionExpirationDate,
  };
}
