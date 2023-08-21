import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/models/mapper/set_service_mapper.dart';

class SetPayerMapper {
  int? payerType;
  String? payerId;
  String? payerName;
  String? payerPhone;
  String? payerCpf;
  String? payerCompanyName;
  SetAddressMapper? payerAddress;
  SetServiceMapper? payerService;
  SetCardMapper? payerCard;

  SetPayerMapper({
    this.payerType,
    this.payerId,
    this.payerName,
    this.payerPhone,
    this.payerCpf,
    this.payerAddress,
    this.payerService,
    this.payerCard,
  });

  SetPayerMapper.MapFromJson(Map<String, dynamic> json) {
    payerId = json['id'];
    payerType = json['person_type'];
    payerName = json['personal_name'];
    payerPhone = json['telephone'];
    payerCpf = json['taxpayer_id'];
    payerCompanyName = json['payerCompanyName'];
    // payerCard = SetCardMapper.MapFromJson(json['payerCard']);
    payerAddress = SetAddressMapper.MapFromJson(json['address']);
    // payerService = SetServiceMapper.MapFromJson(json['payerService']);
    // payerCard = SetCardMapper.MapFromJson(json['payerCard']);
  }

  Map<String, dynamic> mapToFilter() {
    return {
      "id": payerId,
      "name": payerName ?? "",
    };
  }
}
