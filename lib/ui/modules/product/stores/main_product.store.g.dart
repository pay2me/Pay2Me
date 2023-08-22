// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_product.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainProductStore on _MainProductStore, Store {
  Computed<List<SetProductMapper>>? _$productsComputed;

  @override
  List<SetProductMapper> get products => (_$productsComputed ??=
          Computed<List<SetProductMapper>>(() => super.products,
              name: '_MainProductStore.products'))
      .value;
  Computed<int>? _$productsCountComputed;

  @override
  int get productsCount =>
      (_$productsCountComputed ??= Computed<int>(() => super.productsCount,
              name: '_MainProductStore.productsCount'))
          .value;
  Computed<int>? _$productsToOverviewCountComputed;

  @override
  int get productsToOverviewCount => (_$productsToOverviewCountComputed ??=
          Computed<int>(() => super.productsToOverviewCount,
              name: '_MainProductStore.productsToOverviewCount'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MainProductStore.isLoading', context: context);

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

  late final _$productsToOverviewAtom =
      Atom(name: '_MainProductStore.productsToOverview', context: context);

  @override
  List<SetProductMapper> get productsToOverview {
    _$productsToOverviewAtom.reportRead();
    return super.productsToOverview;
  }

  @override
  set productsToOverview(List<SetProductMapper> value) {
    _$productsToOverviewAtom.reportWrite(value, super.productsToOverview, () {
      super.productsToOverview = value;
    });
  }

  late final _$productsToFilterAtom =
      Atom(name: '_MainProductStore.productsToFilter', context: context);

  @override
  List<Map<String, dynamic>> get productsToFilter {
    _$productsToFilterAtom.reportRead();
    return super.productsToFilter;
  }

  @override
  set productsToFilter(List<Map<String, dynamic>> value) {
    _$productsToFilterAtom.reportWrite(value, super.productsToFilter, () {
      super.productsToFilter = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_MainProductStore.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$searchTextNodeAtom =
      Atom(name: '_MainProductStore.searchTextNode', context: context);

  @override
  FocusNode get searchTextNode {
    _$searchTextNodeAtom.reportRead();
    return super.searchTextNode;
  }

  @override
  set searchTextNode(FocusNode value) {
    _$searchTextNodeAtom.reportWrite(value, super.searchTextNode, () {
      super.searchTextNode = value;
    });
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('_MainProductStore.loadProducts', context: context);

  @override
  Future<void> loadProducts(BuildContext context) {
    return _$loadProductsAsyncAction.run(() => super.loadProducts(context));
  }

  late final _$_MainProductStoreActionController =
      ActionController(name: '_MainProductStore', context: context);

  @override
  void onChangedSearch(String? value) {
    final _$actionInfo = _$_MainProductStoreActionController.startAction(
        name: '_MainProductStore.onChangedSearch');
    try {
      return super.onChangedSearch(value);
    } finally {
      _$_MainProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLoadFromFilter(BuildContext context, {Ordering? ordering}) {
    final _$actionInfo = _$_MainProductStoreActionController.startAction(
        name: '_MainProductStore.onLoadFromFilter');
    try {
      return super.onLoadFromFilter(context, ordering: ordering);
    } finally {
      _$_MainProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
productsToOverview: ${productsToOverview},
productsToFilter: ${productsToFilter},
searchController: ${searchController},
searchTextNode: ${searchTextNode},
products: ${products},
productsCount: ${productsCount},
productsToOverviewCount: ${productsToOverviewCount}
    ''';
  }
}
