import 'package:pay_2_me/domain/models/export_models.dart';

class UpdatePayerCommand {
  String? payerId;
  String? payerName;
  String? payerPhone;
  String? payerCpf;
  SetAddressMapper? payerAddress;
  SetCardMapper? payerCard;

  UpdatePayerCommand({
    this.payerId,
    this.payerName,
    this.payerPhone,
    this.payerCpf,
    this.payerAddress,
    this.payerCard,
  });

  Map<String, dynamic> MapToJson() => {
    'name': payerId,
    'payerName': payerName,
    'payerPhone': payerPhone,
    'payerCpf': payerCpf,
    'payerAddress': payerAddress?.jsonFromMap(),
    'payerCard': payerCard?.jsonFromMap(),
  };
}
