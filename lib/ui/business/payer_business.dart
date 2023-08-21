import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';

class PayerBusiness {

  Future<List<SetPayerMapper>?> search(
    String token, 
    {
      String? cpf, 
      String? cnpj, 
      String? email, 
      String? name,
      String? companyName,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  ) async {
    try {
      var service = PayerService();
      var result = await service.search(token);

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

  Future<bool> create(CreatePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.create(command, token);

      if(result == null){
        throw const FormatException('Dados formularios invalidos.');
      }

      return true;
    }
    on FormatException catch(fe) {
      print(fe);
      return false;
    }
    on Exception catch(e) {
      print(e);
      return false;
    }
  }

  Future<bool> update(UpdatePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.update(command, token);

      if(result == null){
        throw const FormatException('Dados formularios invalidos.');
      }

      return true;
    }
    on FormatException catch(fe) {
      print(fe);
      return false;
    }
    on Exception catch(e) {
      print(e);
      return false;
    }
  }

  Future<bool> delete(DeletePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.delete(command, token);

      if(result == null){
        throw const FormatException('Dados formularios invalidos.');
      }

      return result;
    }
    on FormatException catch(fe) {
      print(fe);
      return false;
    }
    on Exception catch(e) {
      print(e);
      return false;
    }
  }
}