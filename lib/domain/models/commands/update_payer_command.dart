import 'package:pay_2_me/domain/models/export_models.dart';

class UpdatePayerCommand {
  int? payerId;
  int? payerType;
  String? payerCnpj;
  String? payerCompanyName;
  String? payerCpf;
  String? payerName;
  String? payerPhone;
  String? payerEmail;
  String? payerFullName;
  SetAddressMapper? payerAddress;

  UpdatePayerCommand({
    this.payerId,
    this.payerType,
    this.payerCnpj,
    this.payerCompanyName,
    this.payerCpf,
    this.payerName,
    this.payerPhone,
    this.payerEmail,
    this.payerFullName,
    this.payerAddress,
  });

  Map<String, dynamic> MapToJson() => {
    'id': payerId,
    'person_type': payerType,
    'ein': payerCnpj,
    'company_name': payerCompanyName,
    'taxpayer_id': payerCpf,
    'personal_name': payerName,
    'telephone': payerPhone,
    'email': payerEmail,
    'address': payerAddress!.jsonFromMap(),
  };
}
