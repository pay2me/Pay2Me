import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/models/mapper/set_service_mapper.dart';

class SetPayerMapper {
  String? payerId;
  String? payerName;
  String? payerPhone;
  String? payerCpf;
  String? payerCnpj;
  SetAddressMapper? payerAddress;
  SetServiceMapper? payerService;
  SetCardMapper? payerCard;

  SetPayerMapper({
    this.payerId,
    this.payerName,
    this.payerPhone,
    this.payerCpf,
    this.payerCnpj,
    this.payerAddress,
    this.payerCard,
  });

  SetPayerMapper.MapFromJson(Map<String, dynamic> json) {
    payerId = json['name'];
    payerName = json['payerName'];
    payerPhone = json['payerPhone'];
    payerCpf = json['payerCpf'];
    payerCnpj = json['payerCnpj'];
    payerAddress = SetAddressMapper.MapFromJson(json['payerAddress']);
    payerCard = SetCardMapper.MapFromJson(json['payerCard']);
  }

   Map<String, dynamic> mapToFilter() {
    return {
      "id": payerId,
      "name": payerName??"",
    };
  }
}
