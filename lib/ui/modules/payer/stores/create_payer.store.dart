import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/payer/export_payer.dart';
import 'package:pay_2_me/ui/shared/functions/formUtility.dart';

part 'create_payer.store.g.dart';

class CreatePayerStore = _CreatePayerStore with _$CreatePayerStore;

abstract class _CreatePayerStore with Store, ChangeNotifier {
  @observable
  bool isLoading = false;

  @observable
  var formKey = GlobalKey<FormState>();

  @observable
  SetPayerMapper payerToForm = SetPayerMapper(
    payerAddress: SetAddressMapper(),
  );
  @observable
  SetCardMapper cardToForm = SetCardMapper();
  @observable
  SetSubscriptionMapper subscriptionToForm = SetSubscriptionMapper();
  @observable
  SetServiceMapper serviceToForm = SetServiceMapper();

  Map<String, bool> validityOfFields = ObservableMap<String, bool>();

  @computed
  bool get formIsValid {
    for (String key in validityOfFields.keys) {
      if((validityOfFields[key] ?? false)==false) return false;
    }
    return true;
  }

  @action
  String? fieldValidator(BuildContext context, String fieldName, dynamic value, bool fieldCanBeNull) {
    final service = FormUtility();

    String? errorMessage = service.validate(fieldName, value, fieldCanBeNull);

    if (errorMessage != null) {
      validityOfFields[fieldName] = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            errorMessage,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      );
    }
    return null;
  }

  @action
  Future<void> submitCreateForm(BuildContext context) async {
    isLoading = true;
    
    formKey.currentState?.validate();
    if (!formIsValid) {
      isLoading = false;
      return;
    }

    formKey.currentState?.save();

    final servicesPayerStore = Provider.of<ServicesPayerStore>(context, listen: false);
    final mainPayerStore = Provider.of<MainPayerStore>(context, listen: false);

    try {
      bool addComplete = await servicesPayerStore.createPayer(context, payerToForm);
      if(!addComplete) throw const FormatException('Erro na adição do área');
      else showMessage(context);

      await mainPayerStore.loadPayers(context);
      
      Navigator.of(context).pop();

    } on FormatException catch (e) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ocorreu um erro!'),
          content: Text(e.message),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }

    isLoading = false;
  }

  void showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Pagador cadastrado com sucesso!",
          ),
        ),
      );
  }
}
