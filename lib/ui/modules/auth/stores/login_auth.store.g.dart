// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_auth.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginAuthStore on _LoginAuthStore, Store {
  Computed<bool>? _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_LoginAuthStore.formIsValid'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_LoginAuthStore.isLoading', context: context);

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

  late final _$isObscureAtom =
      Atom(name: '_LoginAuthStore.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$userToFormAtom =
      Atom(name: '_LoginAuthStore.userToForm', context: context);

  @override
  SetUserMapper get userToForm {
    _$userToFormAtom.reportRead();
    return super.userToForm;
  }

  @override
  set userToForm(SetUserMapper value) {
    _$userToFormAtom.reportWrite(value, super.userToForm, () {
      super.userToForm = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_LoginAuthStore.formKey', context: context);

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

  late final _$submitLoginFormAsyncAction =
      AsyncAction('_LoginAuthStore.submitLoginForm', context: context);

  @override
  Future<void> submitLoginForm(BuildContext context) {
    return _$submitLoginFormAsyncAction
        .run(() => super.submitLoginForm(context));
  }

  late final _$_LoginAuthStoreActionController =
      ActionController(name: '_LoginAuthStore', context: context);

  @override
  void changeObscure() {
    final _$actionInfo = _$_LoginAuthStoreActionController.startAction(
        name: '_LoginAuthStore.changeObscure');
    try {
      return super.changeObscure();
    } finally {
      _$_LoginAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isObscure: ${isObscure},
userToForm: ${userToForm},
formKey: ${formKey},
formIsValid: ${formIsValid}
    ''';
  }
}
