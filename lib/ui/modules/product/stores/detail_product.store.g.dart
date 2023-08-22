// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_product.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailProductStore on _DetailProductStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_DetailProductStore.isLoading', context: context);

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
      Atom(name: '_DetailProductStore.permissions', context: context);

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

  late final _$productToDetailAtom =
      Atom(name: '_DetailProductStore.productToDetail', context: context);

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
      Atom(name: '_DetailProductStore.changeEnable', context: context);

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

  late final _$loadDataProductAsyncAction =
      AsyncAction('_DetailProductStore.loadDataProduct', context: context);

  @override
  Future<void> loadDataProduct(BuildContext context, SetProductMapper product) {
    return _$loadDataProductAsyncAction
        .run(() => super.loadDataProduct(context, product));
  }

  late final _$confirmAndDeleteProductAsyncAction = AsyncAction(
      '_DetailProductStore.confirmAndDeleteProduct',
      context: context);

  @override
  Future<void> confirmAndDeleteProduct(
      BuildContext context, SetProductMapper product) {
    return _$confirmAndDeleteProductAsyncAction
        .run(() => super.confirmAndDeleteProduct(context, product));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
permissions: ${permissions},
productToDetail: ${productToDetail},
changeEnable: ${changeEnable}
    ''';
  }
}
