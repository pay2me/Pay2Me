import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class SetPayerMapper {
  String? payerId;
  int? payerType;
  String? payerCnpj;
  String? payerCompanyName;
  String? payerCpf;
  String? payerName;
  String? payerPhone;
  String? payerEmail;
  String? payerFullName;
  SetAddressMapper? payerAddress;
  String? payerDocument;
  DateTime? payerCreatedAt;
  DateTime? payerUpdateAt;
  DateTime? payerDeleteAt;

  SetPayerMapper({
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
    this.payerDocument,
    this.payerCreatedAt,
    this.payerUpdateAt,
    this.payerDeleteAt,
  });

  SetPayerMapper.MapFromJson(Map<String, dynamic> json) {
    payerId = json['id'];
    payerType = json['person_type'];
    payerCnpj = json['ein'];
    payerCompanyName = json['company_name'];
    payerCpf = json['taxpayer_id'];
    payerName = json['personal_name'];
    payerPhone = json['telephone'];
    payerEmail = json['email'];
    payerFullName = json['fullname'];
    payerAddress = SetAddressMapper.MapFromJson(json['address']);
    payerDocument = json['document'];
    payerCreatedAt = DateUtility().stringToDate(json['created_at']);
    payerUpdateAt = DateUtility().stringToDate(json['updated_at']);
    payerDeleteAt = DateUtility().stringToDate(json['deleted_at']);
  }

  Map<String, dynamic> mapToFilter() {
    return {
      "id": payerId,
      "name": payerName ?? "",
    };
  }
}
