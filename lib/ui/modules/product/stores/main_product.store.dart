import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/modules/search/export_search.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/export_modules.dart';

part 'main_product.store.g.dart';

class MainProductStore = _MainProductStore with _$MainProductStore;

abstract class _MainProductStore with Store, ChangeNotifier {
  @observable
  bool isLoading = false;

  List<SetProductMapper> _productList = [];

  @observable
  List<SetProductMapper> productsToOverview = [];

  @observable
  List<Map<String, dynamic>> productsToFilter = [];

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  FocusNode searchTextNode = FocusNode();

  @computed
  List<SetProductMapper> get products => [..._productList];

  @computed
  int get productsCount => _productList.length;

  @computed
  int get productsToOverviewCount => productsToOverview.length;

  @action
  Future<void> loadProducts(BuildContext context) async {
    isLoading = true;

    _productList = await Provider.of<ServicesProductStore>(context, listen: false).searchProducts(context);
    onLoadFromFilter(context);
    onChangedSearch(searchController.text.isEmpty ? null : searchController.text);

    isLoading = false;
  }

  @action
  void onChangedSearch(String? value) {
    if (value == null) return;
    productsToOverview = _productList
        .where((product) => product.productDescription!
            .contains(RegExp(value, caseSensitive: false)))
        .toList();
  }

  @action
  void onLoadFromFilter(BuildContext context, {Ordering? ordering}) {
    productsToOverview.clear();
    productsToFilter = _productList.map((e) => e.mapToFilter()).toList();
    productsToFilter = Provider.of<ServicesSearchStore>(context, listen: false)
        .getSortedListFromFilter(productsToFilter, ordering: ordering);

    for (var map in productsToFilter) {
      productsToOverview.add(_productList
          .where((element) => element.productId == map["id"])
          .toList()[0]);
    }
  }
}
