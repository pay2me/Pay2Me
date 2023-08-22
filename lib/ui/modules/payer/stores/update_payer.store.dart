import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/modules/export_stores.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/shared/functions/formUtility.dart';

part 'update_payer.store.g.dart';

class UpdatePayerStore = _UpdatePayerStore with _$UpdatePayerStore;

abstract class _UpdatePayerStore with Store, ChangeNotifier {
  @observable
  bool isLoading = false;

  @observable
  var formKey = GlobalKey<FormState>();

  @observable
  List<DropdownMenuItem> productsToDropdown = [];

  @observable
  SetPayerMapper payerToForm = SetPayerMapper(
    payerAddress: SetAddressMapper(),
  );
  @observable
  SetSubscriptionMapper subscriptionToForm = SetSubscriptionMapper();
  @observable
  SetProductMapper productToForm = SetProductMapper();

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
  Future<void> loadUpdateCliente(BuildContext context) async {
    isLoading = true;

    List<SetProductMapper> products = await Provider.of<ServicesProductStore>(context, listen: false).searchProducts(context);

    productsToDropdown = products.map(
      (product) => DropdownMenuItem(
        child: Text(product.productDescription??""), 
        value: product,
      )
    ).toList();
    
    isLoading = false;
  }

  @action
  Future<void> submitUpdateForm(BuildContext context) async {
    isLoading = true;
    
    formKey.currentState?.validate();
    if (!formIsValid) {
      isLoading = false;
      return;
    }

    formKey.currentState?.save();

    final servicesPayerStore = Provider.of<ServicesPayerStore>(context, listen: false);
    final servicesSubscriptionStore = Provider.of<ServicesSubscriptionStore>(context, listen: false);
    final mainPayerStore = Provider.of<MainPayerStore>(context, listen: false);

    try {
      String? payerUpdatedId = await servicesPayerStore.updatePayer(context, payerToForm);
      if(payerUpdatedId != null) await servicesSubscriptionStore.updateSubscription(context, subscriptionToForm);
      
      if(payerUpdatedId == null) throw const FormatException('Erro na adição do pagador');
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
