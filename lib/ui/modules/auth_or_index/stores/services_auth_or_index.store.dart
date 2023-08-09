import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/ui/business/authenticate_business.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/modules/auth/stores/services_auth.store.dart';

part 'services_auth_or_index.store.g.dart';

class ServicesAuthOrIndexStore = _ServicesAuthOrIndexStore with _$ServicesAuthOrIndexStore;

abstract class _ServicesAuthOrIndexStore with Store, ChangeNotifier {

  Future<bool> isAutheticate() async {

    final authBusiness = AuthenticateBusiness();

    return (await authBusiness.isAutheticate())??false;
  }

  Future<SetAuthenticateMapper?> autoLogin(BuildContext context) async {

    final store = Provider.of<ServicesAuthStore>(context, listen:false);

    SetAuthenticateMapper? authData = await store.getAuthData();

    if((authData?.isIncomplete())??false) throw const FormatException("Não foi possivel fazer o auto-login");

    bool isAuth = await isAutheticate();
    
    if(isAuth) {
      return authData;
    } else {
      return await store.login(authData!.authUser!);
    }
  }

}
