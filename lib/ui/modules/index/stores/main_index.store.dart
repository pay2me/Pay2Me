import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/mapper/set_authenticate_mapper.dart';
import 'package:pay_2_me/ui/modules/auth/stores/services_auth.store.dart';

part 'main_index.store.g.dart';

class MainIndexStore = _MainIndexStore with _$MainIndexStore;

abstract class _MainIndexStore with Store, ChangeNotifier {
  @observable
  SetAuthenticateMapper storegeAuthData = SetAuthenticateMapper();

  @action
  Future<void> init(BuildContext context) async {
    storegeAuthData =
        (await Provider.of<ServicesAuthStore>(context, listen: false)
            .getAuthData())!;

    print(storegeAuthData.authUser?.userId);
    print(storegeAuthData.authToken);
  }
}
