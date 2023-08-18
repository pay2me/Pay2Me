import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/models/mapper/set_service_mapper.dart';
import 'package:pay_2_me/ui/modules/search/export_search.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/export_modules.dart';

part 'main_payer.store.g.dart';

class MainPayerStore = _MainPayerStore with _$MainPayerStore;

abstract class _MainPayerStore with Store, ChangeNotifier {

  @observable
  bool isLoading = false;

  List<SetPayerMapper> _payerList = [
    SetPayerMapper(
      payerId: "1",
      payerName: "Oscar Borges Faleta Santana",
      payerCpf: "123.456.789-10",
      payerPhone: "+55 (71) 997335815",
      payerCnpj: "123.456.78/1234-56",
      payerCompanyName: "Pay2Me",
      payerAddress: SetAddressMapper(
        addressCEP: "12345-678",
        addressCity: "Algoinhas",
        addressNeighborhood: "Centro",
        addressState: "Bahia",
      ),
      payerCard: SetCardMapper(
        cardId: "1",
        cardCvv: "123",
        cardExpiryDate: DateTime.now(),
        cardNumber: "1234.5678.9012.3456",
        cardPrintedName: "Oscar B F Santana",
      ),
      payerService: SetServiceMapper(
        serviceName: "Qualquer Serviço",
        serviceValue: "200",
        serviceFrequency: "12 meses",
        serviceExpirationPlanDate: DateTime.now().add(Duration(days: 30)),
        serviceSubscriptionExpirationDate: DateTime.now().add(Duration(days: 90)),
      )
    ),
    SetPayerMapper(
      payerId: "2",
      payerName: "Elton Faleta",
      payerCpf: "123.456.789-10",
      payerPhone: "+55 (71) 997335815",
      payerCnpj: "123.456.78/1234-56",
      payerCompanyName: "Pay2Me",
      payerAddress: SetAddressMapper(
        addressCEP: "12345-678",
        addressCity: "Algoinhas",
        addressNeighborhood: "Centro",
        addressState: "Bahia",
      ),
      payerCard: SetCardMapper(
        cardId: "2",
        cardCvv: "123",
        cardExpiryDate: DateTime.now(),
        cardNumber: "1234.5678.9012.3456",
        cardPrintedName: "Elton F Santana",
      ),
      payerService: SetServiceMapper(
        serviceName: "Outro Serviço",
        serviceValue: "200",
        serviceFrequency: "12 meses",
        serviceExpirationPlanDate: DateTime.now().subtract(Duration(days: 90)),
        serviceSubscriptionExpirationDate: DateTime.now().subtract(Duration(days: 30)),
      )
    )
  ];

  @observable
  List<SetPayerMapper> payersToOverview = [];

  @observable
  List<Map<String, dynamic>> payersToFilter = [];

  @computed
  List<SetPayerMapper> get payers => [..._payerList];

  @computed
  int get payersCount => _payerList.length;

  @computed
  int get payersToOverviewCount => payersToOverview.length;

  @action
  Future<void> loadPayers(BuildContext  context) async {
    isLoading = true;

    // _payerList = await Provider.of<ServicesPayerStore>(context, listen:false).getPayers(context);
    onLoadFromFilter(context);

    isLoading = false;
  }

  @action
  void onChangedSearch(String value) {
    payersToOverview = _payerList.where((payer) => payer.payerName!.contains(RegExp(value, caseSensitive: false))).toList();
  }

  @action
  void onLoadFromFilter(BuildContext  context, {Ordering? ordering}) {
    payersToOverview.clear();
    payersToFilter = _payerList.map((e) => e.mapToFilter()).toList();
    payersToFilter = Provider.of<ServicesSearchStore>(context, listen:false).getSortedListFromFilter(payersToFilter, ordering: ordering);
    
    for (var map in payersToFilter) {
      payersToOverview.add(_payerList.where((element) => element.payerId == map["id"]).toList()[0]);
    }
  }
}
