// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_search.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainSearchStore on _MainSearchStore, Store {
  late final _$currentOderingAtom =
      Atom(name: '_MainSearchStore.currentOdering', context: context);

  @override
  Ordering? get currentOdering {
    _$currentOderingAtom.reportRead();
    return super.currentOdering;
  }

  @override
  set currentOdering(Ordering? value) {
    _$currentOderingAtom.reportWrite(value, super.currentOdering, () {
      super.currentOdering = value;
    });
  }

  late final _$selectedOderingAtom =
      Atom(name: '_MainSearchStore.selectedOdering', context: context);

  @override
  Ordering? get selectedOdering {
    _$selectedOderingAtom.reportRead();
    return super.selectedOdering;
  }

  @override
  set selectedOdering(Ordering? value) {
    _$selectedOderingAtom.reportWrite(value, super.selectedOdering, () {
      super.selectedOdering = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_MainSearchStore.controller', context: context);

  @override
  TextEditingController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(TextEditingController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$textNodeAtom =
      Atom(name: '_MainSearchStore.textNode', context: context);

  @override
  FocusNode get textNode {
    _$textNodeAtom.reportRead();
    return super.textNode;
  }

  @override
  set textNode(FocusNode value) {
    _$textNodeAtom.reportWrite(value, super.textNode, () {
      super.textNode = value;
    });
  }

  late final _$showFiltersAsyncAction =
      AsyncAction('_MainSearchStore.showFilters', context: context);

  @override
  Future<void> showFilters(
      BuildContext context,
      List<Map<String, dynamic>> listToFilter,
      void Function(BuildContext, {Ordering? ordering}) onLoadFromFilter) {
    return _$showFiltersAsyncAction
        .run(() => super.showFilters(context, listToFilter, onLoadFromFilter));
  }

  late final _$_MainSearchStoreActionController =
      ActionController(name: '_MainSearchStore', context: context);

  @override
  void clearSearch(BuildContext context, void Function(String) onChangedSearch,
      void Function(BuildContext, {Ordering? ordering}) onLoadFromFilter) {
    final _$actionInfo = _$_MainSearchStoreActionController.startAction(
        name: '_MainSearchStore.clearSearch');
    try {
      return super.clearSearch(context, onChangedSearch, onLoadFromFilter);
    } finally {
      _$_MainSearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentOdering: ${currentOdering},
selectedOdering: ${selectedOdering},
controller: ${controller},
textNode: ${textNode}
    ''';
  }
}
