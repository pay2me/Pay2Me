import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/mapper/set_authenticate_mapper.dart';
import 'package:pay_2_me/ui/business/authenticate_business.dart';
import 'package:provider/provider.dart';

part 'services_auth.store.g.dart';

class ServicesAuthStore = _ServicesAuthStore with _$ServicesAuthStore;

abstract class _ServicesAuthStore with Store, ChangeNotifier {

  final authBusiness = AuthenticateBusiness();

  Future<SetAuthenticateMapper?> login(String email, String password) async {

    return await authBusiness.login(email, password);
  }

  // Future<bool?> logout(BuildContext context) async {
  //   String token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["clientToken"];
  //   return await authBusiness.logout(token);
  // }

  // Future<bool?> signup(BuildContext context, SetClientMapper client) async {
  //   CreateClientCommand command = CreateClientCommand(
  //     clientClientId: client.clientClientId,
  //     clientName: client.clientName,
  //     clientEmail: client.clientEmail,
  //     clientPassword: client.clientPassword,
  //     clientRole: client.clientRole,
  //   );

  //   String token = Provider.of<MainIndexStore>(context, listen:false).storegeAuthData["clientToken"];
  //   return await authBusiness.signup(command, token);
  // }
}
