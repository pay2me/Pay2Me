import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';
import 'package:pay_2_me/infra/services/storege_service.dart';

class AuthenticateBusiness {
  Future<SetAuthenticateMapper?> login(String email, String password) async {
    try {
      var service = AuthenticateService();
      var result = await service.login(email, password);

      if(!(result.success??false)){
        throw const FormatException('Dados formularios invalidos.');
      }

      return result.auth;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool?> logout() async {
    try {
      var service = AuthenticateService();
      var result = await service.logout();

      if(!result){
        throw const FormatException('Dados formularios invalidos.');
      }

      return true;
    }
    on FormatException catch(fe) {
      print(fe);
      return null;
    }
    on Exception catch(e) {
      print(e);
      return null;
    }
  }

  Future<bool?> isAutheticate() async {
    try {
      var service = AuthenticateService();
      bool result = await service.isAutheticate();

      if(!result){
        throw const FormatException('Dados formularios invalidos.');
      }

      return true;
    }
    on FormatException catch(fe) {
      print(fe);
      return null;
    }
    on Exception catch(e) {
      print(e);
      return null;
    }
  }

  Future<bool> saveAuthData(SetAuthenticateMapper authData) async {
    try {
      Map<String, dynamic> mapAuthData = {
        "id": authData.authUser?.userId,
        "name": authData.authUser?.userName,
        "email": authData.authUser?.userEmail,
        "password": authData.authUser?.userPassword,
        "token": authData.authToken,
      };
      return await StoregeServices.saveMap("storegeAuthData", mapAuthData);
    } catch (e) {
      return false;
    }
  }
  
  Future<bool> removeAuthData() async {
    try {
      return await StoregeServices.remove("storegeAuthData");
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getAuthData() async {
    try {
      return (await StoregeServices.getMap("storegeAuthData"))??{};
    } catch (e) {
      return {};
    }
  }
}
