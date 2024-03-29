// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_payer.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPayerStore on _MainPayerStore, Store {
  Computed<List<SetPayerMapper>>? _$payersComputed;

  @override
  List<SetPayerMapper> get payers =>
      (_$payersComputed ??= Computed<List<SetPayerMapper>>(() => super.payers,
              name: '_MainPayerStore.payers'))
          .value;
  Computed<int>? _$payersCountComputed;

  @override
  int get payersCount =>
      (_$payersCountComputed ??= Computed<int>(() => super.payersCount,
              name: '_MainPayerStore.payersCount'))
          .value;
  Computed<int>? _$payersToOverviewCountComputed;

  @override
  int get payersToOverviewCount => (_$payersToOverviewCountComputed ??=
          Computed<int>(() => super.payersToOverviewCount,
              name: '_MainPayerStore.payersToOverviewCount'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MainPayerStore.isLoading', context: context);

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

  late final _$payersToOverviewAtom =
      Atom(name: '_MainPayerStore.payersToOverview', context: context);

  @override
  List<SetPayerMapper> get payersToOverview {
    _$payersToOverviewAtom.reportRead();
    return super.payersToOverview;
  }

  @override
  set payersToOverview(List<SetPayerMapper> value) {
    _$payersToOverviewAtom.reportWrite(value, super.payersToOverview, () {
      super.payersToOverview = value;
    });
  }

  late final _$payersToFilterAtom =
      Atom(name: '_MainPayerStore.payersToFilter', context: context);

  @override
  List<Map<String, dynamic>> get payersToFilter {
    _$payersToFilterAtom.reportRead();
    return super.payersToFilter;
  }

  @override
  set payersToFilter(List<Map<String, dynamic>> value) {
    _$payersToFilterAtom.reportWrite(value, super.payersToFilter, () {
      super.payersToFilter = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_MainPayerStore.searchController', context: context);

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
      Atom(name: '_MainPayerStore.searchTextNode', context: context);

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

  late final _$loadPayersAsyncAction =
      AsyncAction('_MainPayerStore.loadPayers', context: context);

  @override
  Future<void> loadPayers(BuildContext context) {
    return _$loadPayersAsyncAction.run(() => super.loadPayers(context));
  }

  late final _$_MainPayerStoreActionController =
      ActionController(name: '_MainPayerStore', context: context);

  @override
  void onChangedSearch(String? value) {
    final _$actionInfo = _$_MainPayerStoreActionController.startAction(
        name: '_MainPayerStore.onChangedSearch');
    try {
      return super.onChangedSearch(value);
    } finally {
      _$_MainPayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLoadFromFilter(BuildContext context, {Ordering? ordering}) {
    final _$actionInfo = _$_MainPayerStoreActionController.startAction(
        name: '_MainPayerStore.onLoadFromFilter');
    try {
      return super.onLoadFromFilter(context, ordering: ordering);
    } finally {
      _$_MainPayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
payersToOverview: ${payersToOverview},
payersToFilter: ${payersToFilter},
searchController: ${searchController},
searchTextNode: ${searchTextNode},
payers: ${payers},
payersCount: ${payersCount},
payersToOverviewCount: ${payersToOverviewCount}
    ''';
  }
}
