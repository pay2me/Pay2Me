import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/business/authenticate_business.dart';

part 'services_auth.store.g.dart';

class ServicesAuthStore = _ServicesAuthStore with _$ServicesAuthStore;

abstract class _ServicesAuthStore with Store, ChangeNotifier {

  final authBusiness = AuthenticateBusiness();

  Future<SetAuthenticateMapper?> login(SetUserMapper user) async {
    if(user.userEmail == null || user.userPassword == null) return null;

    SetAuthenticateMapper? authData = await authBusiness.login(user.userEmail!, user.userPassword!);
    
    if(authData == null || authData.isIncomplete()) throw const FormatException("Credenciais Invalidas");

    authData.authUser!.userPassword = user.userPassword;

    bool saveComplete = await authBusiness.saveAuthData(authData);
    
    if(saveComplete) return authData;
    return null;
  }

  Future<bool?> logout(BuildContext context) async {
    
    bool logoutComplete = (await authBusiness.logout())??false;
    
    if(!logoutComplete) return throw const FormatException("Erro ao Sair");
    
    return authBusiness.removeAuthData();
  }

  Future<SetAuthenticateMapper?> getAuthData() async {
    Map<String, dynamic> authData = await authBusiness.getAuthData();
    if(authData.isEmpty) return null;
    return SetAuthenticateMapper.MapFromJson(authData);
  }

  Future<bool?> updateAuthData(SetAuthenticateMapper authData) async {
    SetAuthenticateMapper? lastAuthData = await getAuthData();
    if(lastAuthData == null) return null;

    authData.authUser = authData.authUser??lastAuthData.authUser;
    authData.authToken = authData.authToken??lastAuthData.authToken;

    return await authBusiness.saveAuthData(authData);
  }
}
