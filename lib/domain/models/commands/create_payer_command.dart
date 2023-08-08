import 'package:pay_2_me/domain/models/export_models.dart';

class CreatePayerCommand {
  String? payerName;
  String? payerPhone;
  String? payerCpf;
  SetAddressMapper? payerAddress;
  SetCardMapper? payerCard;

  CreatePayerCommand({
    this.payerName,
    this.payerPhone,
    this.payerCpf,
    this.payerAddress,
    this.payerCard,
  });

  Map<String, dynamic> MapToJson() => {
    'name': payerName,
    'payerPhone': payerPhone,
    'payerCpf': payerCpf,
    'payerAddress': payerAddress?.jsonFromMap(),
    'payerCard': payerCard?.jsonFromMap(),
  };
}
