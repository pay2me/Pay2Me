import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/business/authenticate_business.dart';

part 'services_auth.store.g.dart';

class ServicesAuthStore = _ServicesAuthStore with _$ServicesAuthStore;

abstract class _ServicesAuthStore with Store, ChangeNotifier {

  final authBusiness = AuthenticateBusiness();

  Future<SetAuthenticateMapper?> login(SetUserMapper user) async {
    if(user.userLogin == null || user.userPassword == null) return null;

    return await authBusiness.login(user.userLogin!, user.userPassword!);
  }

  // Future<bool?> logout(BuildContext context) async {
  //   String token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["clientToken"];
  //   return await authBusiness.logout(token);
  // }
}
