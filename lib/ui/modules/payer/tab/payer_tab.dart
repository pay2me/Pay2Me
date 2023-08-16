import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';
import 'package:pay_2_me/ui/modules/payer/export_payer.dart';
import 'package:pay_2_me/ui/modules/search/widgets/search_bar_widget.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_tab_scaffold.dart';
import 'package:provider/provider.dart';

class PayerTab extends StatelessWidget {
  const PayerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainPayerStore>(context, listen: false);

    return FutureBuilder(
      future: store.loadPayers(context),
      builder: (ctx, snapshot) => Observer(
        builder: (context) => CustomTabScaffold(
          title: "Pagadores",
          automaticallyImplyLeading: false,
          actionsAppBar: [
            IconButton(
              onPressed: store.isLoading
                  ? null
                  : () async => await store.loadPayers(context),
              icon: const Icon(
                Icons.refresh_outlined,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.CREATEPAYERPAGE,
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
                labelText: "Pesquisar pagador",
                hintText: "Informe o código do pagador",
                listToFilter: store.payersToFilter,
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
              snapshot.connectionState == ConnectionState.waiting ||
                      store.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: store.payersToOverviewCount == 0
                          ? const Center(
                              child: Text('Nenhum pagador encontrado'),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: store.payersToOverviewCount,
                              itemBuilder: (ctx, i) => PayerTile(
                                payer: store.payersToOverview[i],
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
