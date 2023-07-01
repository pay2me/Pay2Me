import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/modules/search/export_search.dart';

class SearchFilterDialogWidget extends StatelessWidget {
  final List<Ordering>? ordinations;

  SearchFilterDialogWidget({
    required this.ordinations,
    Key? key,
  }) : super(key: key);

  List<Widget> getOrderingWidgets(List<Ordering>?  ordinations) {
    List<Widget> ordinancesWidgets = [];
    if(ordinations == null) return [
      Center(child: Text("A lista está vazia!"))
    ];

    for (Ordering ordering in ordinations) {
      ordinancesWidgets.add(SearchFilterTile(ordering: ordering));
    }

    return ordinancesWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getOrderingWidgets(ordinations),
    );
  }
}
