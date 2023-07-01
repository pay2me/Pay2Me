import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';

class PayerBusiness {

  Future<List<SetPayerMapper>?> getAll(String token) async {
    try {
      var service = new PayerService();
      var result = await service.getAll(token);

      if(result.code == 406){
        throw const FormatException('Dados formularios invalidos.');
      }

      return result.payers;
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

  Future<List<SetPayerMapper>?> getForId(int id, String token) async {
    try {
      var service = new PayerService();
      var result = await service.getForId(id, token);

      if(result.code == 406){
        throw const FormatException('Dados formularios invalidos.');
      }

      return result.payers;
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

  Future<List<SetPayerMapper>?> getForName(String name, String token) async {
    try {
      var service = new PayerService();
      var result = await service.getForName(name, token);

      if(result.code == 406){
        throw const FormatException('Dados formularios invalidos.');
      }

      return result.payers;
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

  Future<bool?> insert(CreatePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.insert(command, token);

      if(result == 406){
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

  Future<bool?> update(UpdatePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.update(command, token);

      if(result == 406){
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

  Future<bool?> delete(DeletePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.delete(command, token);

      if(result == 406){
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