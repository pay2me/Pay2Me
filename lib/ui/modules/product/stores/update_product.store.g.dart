// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateProductStore on _UpdateProductStore, Store {
  Computed<bool>? _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_UpdateProductStore.formIsValid'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_UpdateProductStore.isLoading', context: context);

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
      Atom(name: '_UpdateProductStore.formKey', context: context);

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

  late final _$productToFormAtom =
      Atom(name: '_UpdateProductStore.productToForm', context: context);

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

  late final _$submitUpdateFormAsyncAction =
      AsyncAction('_UpdateProductStore.submitUpdateForm', context: context);

  @override
  Future<void> submitUpdateForm(BuildContext context) {
    return _$submitUpdateFormAsyncAction
        .run(() => super.submitUpdateForm(context));
  }

  late final _$_UpdateProductStoreActionController =
      ActionController(name: '_UpdateProductStore', context: context);

  @override
  String? fieldValidator(BuildContext context, String fieldName, dynamic value,
      bool fieldCanBeNull) {
    final _$actionInfo = _$_UpdateProductStoreActionController.startAction(
        name: '_UpdateProductStore.fieldValidator');
    try {
      return super.fieldValidator(context, fieldName, value, fieldCanBeNull);
    } finally {
      _$_UpdateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
formKey: ${formKey},
productToForm: ${productToForm},
formIsValid: ${formIsValid}
    ''';
  }
}
