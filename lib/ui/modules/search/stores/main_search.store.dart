import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/search/export_search.dart';
import 'package:pay_2_me/ui/modules/search/widgets/search_filterDialog_widget.dart';

part 'main_search.store.g.dart';

class MainSearchStore = _MainSearchStore with _$MainSearchStore;

abstract class _MainSearchStore with Store, ChangeNotifier {
  @observable
  Ordering? currentOdering;

  @observable
  Ordering? selectedOdering;

  @observable
  TextEditingController controller = TextEditingController();

  @observable
  FocusNode textNode = FocusNode();

  @action
  Future<void> showFilters(BuildContext context, List<Map<String, dynamic>> listToFilter, void Function(BuildContext context, {Ordering? ordering}) onLoadFromFilter) async {
    selectedOdering = selectedOdering??Provider.of<ServicesSearchStore>(context, listen: false).alphabeticalOrdering;
    
    List<Ordering>? ordinations = Provider.of<ServicesSearchStore>(context, listen: false).getOrderingsFromListToSorted(listToFilter);

    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escolha um tipo de ordenação:'),
        content: SizedBox(
          height: (listToFilter.length * 100),
          width: MediaQuery.of(context).size.width * 0.95,
          child: SearchFilterDialogWidget(ordinations: ordinations)
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              selectedOdering = currentOdering;
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              currentOdering = selectedOdering;
              onLoadFromFilter(context, ordering: currentOdering);
              Navigator.of(context).pop();
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @action
  void clearSearch(BuildContext context, void Function(String) onChangedSearch, void Function(BuildContext context, {Ordering? ordering}) onLoadFromFilter) {
    onChangedSearch("");
    controller.text = "";
    onLoadFromFilter(context);
    currentOdering = null;
    selectedOdering = null;

    if (textNode.hasPrimaryFocus || MediaQuery.of(context).viewInsets.bottom > 0) {
      FocusScope.of(context).requestFocus(FocusNode());
    }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Filtros retornados ao padrão!",
          ),
        ),
      );
  }
}
