import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/business/payer_business.dart';
import 'package:pay_2_me/ui/modules/index/stores/main_index.store.dart';

part 'services_payer.store.g.dart';

class ServicesPayerStore = _ServicesPayerStore with _$ServicesPayerStore;

abstract class _ServicesPayerStore with Store, ChangeNotifier {
  //  Business

  final payerBusiness = PayerBusiness();

  // GETS

  Future<List<SetPayerMapper>> searchPayers(
    BuildContext context, {
    String? cpf,
    String? cnpj,
    String? email,
    String? name,
    String? companyName,
    String? sortBy,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    return (await payerBusiness.search(
          token,
          cpf: cpf,
          cnpj: cnpj,
          email: email,
          name: name,
          companyName: companyName,
          sortBy: sortBy,
          orderBy: orderBy,
          limit: limit,
          offset: offset,
        )) ??
        [];
  }

  // CRUD

  Future<String?> createPayer(BuildContext context, SetPayerMapper payer) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    CreatePayerCommand createPayerCommand = CreatePayerCommand(
      payerCpf: payer.payerCpf,
      payerName: payer.payerName,
      payerPhone: payer.payerPhone,
      payerEmail: payer.payerEmail,
      payerFullName: payer.payerFullName,
      payerAddress: payer.payerAddress,
    );

    return (await payerBusiness.create(createPayerCommand, token));
  }

  Future<String?> updatePayer(BuildContext context, SetPayerMapper payer) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    UpdatePayerCommand editPayerCommand = UpdatePayerCommand(
      payerId: payer.payerId,
      payerType: payer.payerType,
      payerCnpj: payer.payerCnpj,
      payerCompanyName: payer.payerCompanyName,
      payerCpf: payer.payerCpf,
      payerName: payer.payerName,
      payerPhone: payer.payerPhone,
      payerEmail: payer.payerEmail,
      payerFullName: payer.payerFullName,
      payerAddress: payer.payerAddress,
    );

    return (await payerBusiness.update(editPayerCommand, token));
  }

  Future<String?> deletePayer(BuildContext context, SetPayerMapper payer) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    DeletePayerCommand deletePayerCommand = DeletePayerCommand(
      payerId: payer.payerId,
    );

    return (await payerBusiness.delete(deletePayerCommand, token));
  }
}
