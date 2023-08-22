// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_payer.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailPayerStore on _DetailPayerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_DetailPayerStore.isLoading', context: context);

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

  late final _$permissionsAtom =
      Atom(name: '_DetailPayerStore.permissions', context: context);

  @override
  List<String> get permissions {
    _$permissionsAtom.reportRead();
    return super.permissions;
  }

  @override
  set permissions(List<String> value) {
    _$permissionsAtom.reportWrite(value, super.permissions, () {
      super.permissions = value;
    });
  }

  late final _$payerToDetailAtom =
      Atom(name: '_DetailPayerStore.payerToDetail', context: context);

  @override
  SetPayerMapper get payerToDetail {
    _$payerToDetailAtom.reportRead();
    return super.payerToDetail;
  }

  @override
  set payerToDetail(SetPayerMapper value) {
    _$payerToDetailAtom.reportWrite(value, super.payerToDetail, () {
      super.payerToDetail = value;
    });
  }

  late final _$cardToDetailAtom =
      Atom(name: '_DetailPayerStore.cardToDetail', context: context);

  @override
  SetCardMapper get cardToDetail {
    _$cardToDetailAtom.reportRead();
    return super.cardToDetail;
  }

  @override
  set cardToDetail(SetCardMapper value) {
    _$cardToDetailAtom.reportWrite(value, super.cardToDetail, () {
      super.cardToDetail = value;
    });
  }

  late final _$subscriptionToDetailAtom =
      Atom(name: '_DetailPayerStore.subscriptionToDetail', context: context);

  @override
  SetSubscriptionMapper get subscriptionToDetail {
    _$subscriptionToDetailAtom.reportRead();
    return super.subscriptionToDetail;
  }

  @override
  set subscriptionToDetail(SetSubscriptionMapper value) {
    _$subscriptionToDetailAtom.reportWrite(value, super.subscriptionToDetail,
        () {
      super.subscriptionToDetail = value;
    });
  }

  late final _$productToDetailAtom =
      Atom(name: '_DetailPayerStore.productToDetail', context: context);

  @override
  SetProductMapper get productToDetail {
    _$productToDetailAtom.reportRead();
    return super.productToDetail;
  }

  @override
  set productToDetail(SetProductMapper value) {
    _$productToDetailAtom.reportWrite(value, super.productToDetail, () {
      super.productToDetail = value;
    });
  }

  late final _$changeEnableAtom =
      Atom(name: '_DetailPayerStore.changeEnable', context: context);

  @override
  bool get changeEnable {
    _$changeEnableAtom.reportRead();
    return super.changeEnable;
  }

  @override
  set changeEnable(bool value) {
    _$changeEnableAtom.reportWrite(value, super.changeEnable, () {
      super.changeEnable = value;
    });
  }

  late final _$loadDataPayerAsyncAction =
      AsyncAction('_DetailPayerStore.loadDataPayer', context: context);

  @override
  Future<void> loadDataPayer(BuildContext context, SetPayerMapper payer) {
    return _$loadDataPayerAsyncAction
        .run(() => super.loadDataPayer(context, payer));
  }

  late final _$confirmAndDeletePayerAsyncAction =
      AsyncAction('_DetailPayerStore.confirmAndDeletePayer', context: context);

  @override
  Future<void> confirmAndDeletePayer(
      BuildContext context, SetPayerMapper payer) {
    return _$confirmAndDeletePayerAsyncAction
        .run(() => super.confirmAndDeletePayer(context, payer));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
permissions: ${permissions},
payerToDetail: ${payerToDetail},
cardToDetail: ${cardToDetail},
subscriptionToDetail: ${subscriptionToDetail},
productToDetail: ${productToDetail},
changeEnable: ${changeEnable}
    ''';
  }
}
