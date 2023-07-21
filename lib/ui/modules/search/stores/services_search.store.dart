import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/ui/shared/shared_enums.dart';

part 'services_search.store.g.dart';

class ServicesSearchStore = _ServicesSearchStore with _$ServicesSearchStore;

class Ordering {
  String label;
  OrderBy orderBy;

  Ordering({
    required this.label,
    required this.orderBy,
  });
}

abstract class _ServicesSearchStore with Store, ChangeNotifier {

  Ordering alphabeticalOrdering = Ordering(
    label: "Ordem Alfabética",
    orderBy: OrderBy.alphabetical,
  );
  Ordering mostRecentOrdering = Ordering(
    label: "Mais Recente",
    orderBy: OrderBy.mostRecent,
  );
  Ordering leastRecentOrdering = Ordering(
    label: "Mais Antigo",
    orderBy: OrderBy.leastRecent,
  );
  Ordering highestValueOrdering = Ordering(
    label: "Maior Valor",
    orderBy: OrderBy.highestValue,
  );
  Ordering lowerValueOrdering = Ordering(
    label: "Menor Valor",
    orderBy: OrderBy.lowerValue,
  );

  List<Map<String, dynamic>> getSortedListFromFilter(List<Map<String, dynamic>> listToSorted, {Ordering? ordering}) {
    if(ordering == null) ordering = alphabeticalOrdering;

    switch (ordering.orderBy) {
      case OrderBy.alphabetical:
        listToSorted.sort((a, b) => (a["name"] as String).compareTo(b["name"] as String));
        break;
      case OrderBy.mostRecent:
        listToSorted.sort((a, b) => (b["date"] as DateTime).compareTo(a["date"] as DateTime));
        break;
      case OrderBy.leastRecent:
        listToSorted.sort((a, b) => (a["date"] as DateTime).compareTo(b["date"] as DateTime));
        break;
      case OrderBy.highestValue:
        listToSorted.sort((a, b) => (b["value"] as double).compareTo(a["value"] as double));
        break;
      case OrderBy.lowerValue:
        listToSorted.sort((a, b) => (a["value"] as double).compareTo(b["value"] as double));
        break;
      default:
    }

    return listToSorted;
  }

  List<Ordering>? getOrderingsFromListToSorted(List<Map<String, dynamic>> listToSorted) {
    List<Ordering> orderings = [];
    if(listToSorted.isEmpty) return null;

    for (var key in listToSorted[0].keys) {
      switch (key) {
        case "name":
          orderings.add(alphabeticalOrdering);
          break;
        case "date":
          orderings.add(mostRecentOrdering);
          orderings.add(leastRecentOrdering);
          break;
        case "value":
          orderings.add(highestValueOrdering);
          orderings.add(lowerValueOrdering);
          break;
        default:
      }
    }

    return orderings;
  }
}
