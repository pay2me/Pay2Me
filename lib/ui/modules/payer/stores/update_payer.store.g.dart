// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_payer.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdatePayerStore on _UpdatePayerStore, Store {
  Computed<bool>? _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_UpdatePayerStore.formIsValid'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_UpdatePayerStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_UpdatePayerStore.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$productsToDropdownAtom =
      Atom(name: '_UpdatePayerStore.productsToDropdown', context: context);

  @override
  List<DropdownMenuItem<dynamic>> get productsToDropdown {
    _$productsToDropdownAtom.reportRead();
    return super.productsToDropdown;
  }

  @override
  set productsToDropdown(List<DropdownMenuItem<dynamic>> value) {
    _$productsToDropdownAtom.reportWrite(value, super.productsToDropdown, () {
      super.productsToDropdown = value;
    });
  }

  late final _$payerToFormAtom =
      Atom(name: '_UpdatePayerStore.payerToForm', context: context);

  @override
  SetPayerMapper get payerToForm {
    _$payerToFormAtom.reportRead();
    return super.payerToForm;
  }

  @override
  set payerToForm(SetPayerMapper value) {
    _$payerToFormAtom.reportWrite(value, super.payerToForm, () {
      super.payerToForm = value;
    });
  }

  late final _$subscriptionToFormAtom =
      Atom(name: '_UpdatePayerStore.subscriptionToForm', context: context);

  @override
  SetSubscriptionMapper get subscriptionToForm {
    _$subscriptionToFormAtom.reportRead();
    return super.subscriptionToForm;
  }

  @override
  set subscriptionToForm(SetSubscriptionMapper value) {
    _$subscriptionToFormAtom.reportWrite(value, super.subscriptionToForm, () {
      super.subscriptionToForm = value;
    });
  }

  late final _$productToFormAtom =
      Atom(name: '_UpdatePayerStore.productToForm', context: context);

  @override
  SetProductMapper get productToForm {
    _$productToFormAtom.reportRead();
    return super.productToForm;
  }

  @override
  set productToForm(SetProductMapper value) {
    _$productToFormAtom.reportWrite(value, super.productToForm, () {
      super.productToForm = value;
    });
  }

  late final _$loadUpdateClienteAsyncAction =
      AsyncAction('_UpdatePayerStore.loadUpdateCliente', context: context);

  @override
  Future<void> loadUpdateCliente(BuildContext context) {
    return _$loadUpdateClienteAsyncAction
        .run(() => super.loadUpdateCliente(context));
  }

  late final _$submitUpdateFormAsyncAction =
      AsyncAction('_UpdatePayerStore.submitUpdateForm', context: context);

  @override
  Future<void> submitUpdateForm(BuildContext context) {
    return _$submitUpdateFormAsyncAction
        .run(() => super.submitUpdateForm(context));
  }

  late final _$_UpdatePayerStoreActionController =
      ActionController(name: '_UpdatePayerStore', context: context);

  @override
  String? fieldValidator(BuildContext context, String fieldName, dynamic value,
      bool fieldCanBeNull) {
    final _$actionInfo = _$_UpdatePayerStoreActionController.startAction(
        name: '_UpdatePayerStore.fieldValidator');
    try {
      return super.fieldValidator(context, fieldName, value, fieldCanBeNull);
    } finally {
      _$_UpdatePayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
formKey: ${formKey},
productsToDropdown: ${productsToDropdown},
payerToForm: ${payerToForm},
subscriptionToForm: ${subscriptionToForm},
productToForm: ${productToForm},
formIsValid: ${formIsValid}
    ''';
  }
}
