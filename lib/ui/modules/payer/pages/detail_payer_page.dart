import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/domain/models/mapper/set_payer_mapper.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';
import 'package:pay_2_me/ui/modules/payer/stores/detail_payer.store.dart';
import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';
import 'package:pay_2_me/ui/shared/widgets/tiles/custom_detail_tile.dart';
import 'package:provider/provider.dart';

class DetailPayerPage extends StatelessWidget {
  const DetailPayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DetailPayerStore>(context, listen: false);

    final SetPayerMapper payer = ModalRoute.of(context)!.settings.arguments as SetPayerMapper;

    return FutureBuilder(
      future: store.loadDataPayer(context, payer),
      builder: (ctx, snapshot) => Observer(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Pagador"),
            actions: [
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 30,
                  ),
                  onPressed: () => store.confirmAndDeletePayer(context, payer),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.EDITPAYERPAGE,
                    arguments: payer,
                  ),
                ),
            ],
            iconTheme: Theme.of(context).iconTheme,
          ),
          body: snapshot.connectionState == ConnectionState.waiting || store.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Informações do Pagador",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.shadow,
                                fontSize: 25,
                              ),
                            ),
                            const Divider(),Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    CustomDetailTile(
                                      detailName: "Nome",
                                      detailData: store.payerToDetail.payerName,
                                    ),
                                    CustomDetailTile(
                                      detailName: "CPF",
                                      detailData: store.payerToDetail.payerCpf,
                                    ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    CustomDetailTile(
                                      detailName: "Cidade",
                                      detailData: store.payerToDetail.payerAddress!.addressCity,
                                    ),
                                    CustomDetailTile(
                                      detailName: "Estado",
                                      detailData: store.payerToDetail.payerAddress!.addressState,
                                    ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    CustomDetailTile(
                                      detailName: "Empresa",
                                      detailData: store.payerToDetail.payerCompanyName,
                                    ),
                                    CustomDetailTile(
                                      detailName: "CNPJ",
                                      detailData: store.payerToDetail.payerCnpj,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Informações da Assinatura",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.shadow,
                                  fontSize: 25,
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        CustomDetailTile(
                                          detailName: "Serviço",
                                          detailData: store.payerToDetail.payerService!.serviceName,
                                        ),
                                        CustomDetailTile(
                                          detailName: "Valor",
                                          detailData: "R\$ ${store.payerToDetail.payerService!.serviceValue}",
                                        ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        CustomDetailTile(
                                          detailName: "Frequência de pagamento",
                                          detailData: store.payerToDetail.payerService!.serviceFrequency,
                                        ),
                                        CustomDetailTile(
                                          detailName: "Vencimento do plano",
                                          detailData: DateUtility().dateToString(store.payerToDetail.payerService!.serviceExpirationPlanDate, format: "dd/MM/yyyy"),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        CustomDetailTile(
                                          detailName: "Vencimento da parcela",
                                          detailData: DateUtility().dateToString(store.payerToDetail.payerService!.serviceSubscriptionExpirationDate, format: "dd/MM/yyyy"),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}