// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payer.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePayerStore on _CreatePayerStore, Store {
  Computed<bool>? _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_CreatePayerStore.formIsValid'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_CreatePayerStore.isLoading', context: context);

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
      Atom(name: '_CreatePayerStore.formKey', context: context);

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
      Atom(name: '_CreatePayerStore.productsToDropdown', context: context);

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
      Atom(name: '_CreatePayerStore.payerToForm', context: context);

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

  late final _$cardToFormAtom =
      Atom(name: '_CreatePayerStore.cardToForm', context: context);

  @override
  SetCardMapper get cardToForm {
    _$cardToFormAtom.reportRead();
    return super.cardToForm;
  }

  @override
  set cardToForm(SetCardMapper value) {
    _$cardToFormAtom.reportWrite(value, super.cardToForm, () {
      super.cardToForm = value;
    });
  }

  late final _$subscriptionToFormAtom =
      Atom(name: '_CreatePayerStore.subscriptionToForm', context: context);

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
      Atom(name: '_CreatePayerStore.productToForm', context: context);

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

  late final _$loadCreateClienteAsyncAction =
      AsyncAction('_CreatePayerStore.loadCreateCliente', context: context);

  @override
  Future<void> loadCreateCliente(BuildContext context) {
    return _$loadCreateClienteAsyncAction
        .run(() => super.loadCreateCliente(context));
  }

  late final _$submitCreateFormAsyncAction =
      AsyncAction('_CreatePayerStore.submitCreateForm', context: context);

  @override
  Future<void> submitCreateForm(BuildContext context) {
    return _$submitCreateFormAsyncAction
        .run(() => super.submitCreateForm(context));
  }

  late final _$_CreatePayerStoreActionController =
      ActionController(name: '_CreatePayerStore', context: context);

  @override
  String? fieldValidator(BuildContext context, String fieldName, dynamic value,
      bool fieldCanBeNull) {
    final _$actionInfo = _$_CreatePayerStoreActionController.startAction(
        name: '_CreatePayerStore.fieldValidator');
    try {
      return super.fieldValidator(context, fieldName, value, fieldCanBeNull);
    } finally {
      _$_CreatePayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
formKey: ${formKey},
productsToDropdown: ${productsToDropdown},
payerToForm: ${payerToForm},
cardToForm: ${cardToForm},
subscriptionToForm: ${subscriptionToForm},
productToForm: ${productToForm},
formIsValid: ${formIsValid}
    ''';
  }
}
