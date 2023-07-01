import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/ui/business/storege_business.dart';

part 'main_index.store.g.dart';

class MainIndexStore = _MainIndexStore with _$MainIndexStore;

abstract class _MainIndexStore with Store, ChangeNotifier {

  @observable
  Map<String, dynamic> storegeAuthData = ObservableMap();

  @observable
  bool? isAdmin;

  @action
  Future<void> init(BuildContext context) async {

    storegeAuthData = (await StoregeBusiness.getMap("storegeAuthData"))??{};
    isAdmin = storegeAuthData["clientPermissionType"] == 1 || storegeAuthData["clientPermissionType"] == 2;
    
  }

}