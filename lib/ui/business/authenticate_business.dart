import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';

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

  Future<bool?> logout(String token) async {
    try {
      var service = AuthenticateService();
      var result = await service.logout(token);

      if(result != 200){
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
}
