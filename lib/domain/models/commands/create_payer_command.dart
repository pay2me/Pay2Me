import 'package:pay_2_me/domain/models/export_models.dart';

class CreatePayerCommand {
  String? payerCnpj;
  String? payerCompanyName;
  String? payerCpf;
  String? payerName;
  String? payerPhone;
  String? payerEmail;
  String? payerFullName;
  SetAddressMapper? payerAddress;

  CreatePayerCommand({
    this.payerCpf,
    this.payerName,
    this.payerPhone,
    this.payerEmail,
    this.payerFullName,
    this.payerAddress,
  });

  Map<String, dynamic> MapToJson() => {
    'person_type': 1,
    'taxpayer_id': payerCpf,
    'personal_name': payerName,
    'telephone': payerPhone,
    'email': payerEmail,
    'address': payerAddress!.jsonFromMap(),
  };
}
