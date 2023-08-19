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

  Future<List<SetPayerMapper>> getPayers(BuildContext context) async {
    String token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["token"];

    return (await payerBusiness.getAll(token))??[];
  }

  // CRUD

  Future<bool> createPayer(BuildContext context, SetPayerMapper payer) async {
    String? token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["userToken"];

    CreatePayerCommand createPayerCommand = CreatePayerCommand(
      payerName: payer.payerName,
      payerPhone: payer.payerPhone,
      payerCpf: payer.payerCpf,
      payerAddress: payer.payerAddress,
      payerCard: payer.payerCard,
    );

    return (await payerBusiness.insert(createPayerCommand, token!));
  }

  Future<bool> updatePayer(BuildContext context, SetPayerMapper payer) async {
    String? token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["userToken"];
    
    UpdatePayerCommand editPayerCommand = UpdatePayerCommand(
      payerId: payer.payerId,
      payerName: payer.payerName,
      payerPhone: payer.payerPhone,
      payerCpf: payer.payerCpf,
      payerAddress: payer.payerAddress,
      payerCard: payer.payerCard,
    );

    return (await payerBusiness.update(editPayerCommand, token!));
  }

  Future<bool> deletePayer(BuildContext context, SetPayerMapper payer) async {
    String? token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["userToken"];
    
    DeletePayerCommand deletePayerCommand = DeletePayerCommand(
      payerId: payer.payerId,
    );

    return (await payerBusiness.delete(deletePayerCommand, token!));
  }
}
