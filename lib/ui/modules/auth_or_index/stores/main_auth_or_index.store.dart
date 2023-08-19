import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/modules/auth_or_index/stores/export_auth_or_index_stores.dart';

part 'main_auth_or_index.store.g.dart';

class MainAuthOrIndexStore = _MainAuthOrIndexStore with _$MainAuthOrIndexStore;

abstract class _MainAuthOrIndexStore with Store, ChangeNotifier {

  @observable
  bool isAuth = false;

  @action
  Future<void> loadAutoLogin(BuildContext context) async {
    try {
      final store = Provider.of<ServicesAuthOrIndexStore>(context, listen:false);

      SetAuthenticateMapper? authData = await store.autoLogin(context);

      if(authData == null) isAuth = false;
      else isAuth = true;
      
    } catch (e) {
      isAuth = false;
    }
  }

}