import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/search/stores/export_search_stores.dart';

class SearchBarWidget extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final List<Map<String, dynamic>>? listToFilter;
  final void Function(String) onChangedSearch;
  final void Function(BuildContext context, {Ordering? ordering})? onLoadFromFilter;

  SearchBarWidget({
    required this.labelText,
    required this.onChangedSearch,
    this.hintText,
    this.listToFilter,
    this.onLoadFromFilter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainSearchStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                focusNode: store.textNode,
                onChanged: onChangedSearch,
                controller: store.controller,
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 10,
                  )),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 2,
                  )),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            if (listToFilter != null)
              Row(
                children: [
                  VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list_outlined),
                    onPressed: () async => await store.showFilters(context, listToFilter!, onLoadFromFilter!),
                  ),
                  VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  IconButton(
                    onPressed: () => store.clearSearch(context, onChangedSearch, onLoadFromFilter??((context, {Ordering? ordering}){})),
                    icon: Icon(Icons.close_outlined),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
