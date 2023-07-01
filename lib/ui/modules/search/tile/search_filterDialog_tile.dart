import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/ui/modules/search/export_search.dart';
import 'package:provider/provider.dart';

class SearchFilterTile extends StatelessWidget {
  final Ordering ordering;

  SearchFilterTile({
    required this.ordering,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainSearchStore>(context, listen: false);

    return Observer(
      builder: (context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ordering.label),
              Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      Theme.of(context).colorScheme.secondary,
                ),
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: ordering.orderBy == store.selectedOdering?.orderBy,
                  onChanged: (isChecked) => store.selectedOdering = ordering,
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
