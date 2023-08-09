class SetServiceMapper {
  String? serviceName;
  String? serviceValue;
  String? serviceFrequency;
  String? serviceExpirationPlaneDate;
  String? serviceExpirationPortionDate;

  SetServiceMapper({
    this.serviceName,
    this.serviceValue,
    this.serviceFrequency,
    this.serviceExpirationPlaneDate,
    this.serviceExpirationPortionDate,
  });

  SetServiceMapper.MapFromJson(Map<String, dynamic> json) {
    serviceName = json['serviceName'];
    serviceValue = json['serviceValue'];
    serviceFrequency = json['serviceFrequency'];
    serviceExpirationPlaneDate = json['serviceExpirationPlaneDate'];
    serviceExpirationPortionDate = json['serviceExpirationPortionDate'];
  }

  Map<String, dynamic> jsonFromMap() => {
    'serviceName': serviceName,
    'serviceValue': serviceValue,
    'serviceFrequency': serviceFrequency,
    'serviceExpirationPlaneDate': serviceExpirationPlaneDate,
    'serviceExpirationPortionDate': serviceExpirationPortionDate,
  };
}
