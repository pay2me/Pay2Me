import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';
import 'package:pay_2_me/ui/modules/product/export_product.dart';
import 'package:pay_2_me/ui/modules/search/widgets/search_bar_widget.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_tab_scaffold.dart';
import 'package:provider/provider.dart';

class ProductTab extends StatelessWidget {
  final PageController pageController;
  const ProductTab(this.pageController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainProductStore>(context, listen: false);

    return FutureBuilder(
      future: store.loadProducts(context),
      builder: (ctx, snapshot) => Observer(
        builder: (context) => CustomTabScaffold(
          title: "Produtos",
          pageController: pageController,
          actionsAppBar: [
            IconButton(
              onPressed: store.isLoading
                  ? null
                  : () async => await store.loadProducts(context),
              icon: const Icon(
                Icons.refresh_outlined,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.CREATEPRODUCTPAGE,
                );
              },
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
          body: Column(
            children: [
              SearchBarWidget(
                labelText: "Pesquisar Produtos",
                hintText: "Informe o nome do produto",
                listToFilter: store.productsToFilter,
                searchController: store.searchController,
                searchTextNode: store.searchTextNode,
                onChangedSearch: store.onChangedSearch,
                onLoadFromFilter: store.onLoadFromFilter,
              ),
              const Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text("")),
                  Expanded(child: Text("NOME")),
                  Expanded(child: Text("SERVIÇO")),
                  Expanded(child: Text("SITUAÇÃO")),
                ],
              ),
              snapshot.connectionState == ConnectionState.waiting || store.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: store.productsToOverviewCount == 0
                          ? const Center(
                              child: Text('Nenhum produto encontrado'),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: store.productsToOverviewCount,
                              itemBuilder: (ctx, i) => ProductTile(
                                product: store.productsToOverview[i],
                                index: i,
                              ),
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
