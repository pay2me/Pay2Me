// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_index.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainIndexStore on _MainIndexStore, Store {
  late final _$storegeAuthDataAtom =
      Atom(name: '_MainIndexStore.storegeAuthData', context: context);

  @override
  Map<String, dynamic> get storegeAuthData {
    _$storegeAuthDataAtom.reportRead();
    return super.storegeAuthData;
  }

  @override
  set storegeAuthData(Map<String, dynamic> value) {
    _$storegeAuthDataAtom.reportWrite(value, super.storegeAuthData, () {
      super.storegeAuthData = value;
    });
  }

  late final _$isAdminAtom =
      Atom(name: '_MainIndexStore.isAdmin', context: context);

  @override
  bool? get isAdmin {
    _$isAdminAtom.reportRead();
    return super.isAdmin;
  }

  @override
  set isAdmin(bool? value) {
    _$isAdminAtom.reportWrite(value, super.isAdmin, () {
      super.isAdmin = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_MainIndexStore.init', context: context);

  @override
  Future<void> init(BuildContext context) {
    return _$initAsyncAction.run(() => super.init(context));
  }

  @override
  String toString() {
    return '''
storegeAuthData: ${storegeAuthData},
isAdmin: ${isAdmin}
    ''';
  }
}