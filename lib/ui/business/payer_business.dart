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
      var result = await service.search(
        token,
        cpf: cpf,
        cnpj: cnpj,
        email: email,
        name: name,
        companyName: companyName,
        sortBy: sortBy,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );

      if(result.code != 200){
        throw const FormatException('Falha na busca');
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

  Future<String?> create(CreatePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.create(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.payers![0].payerId;
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

  Future<String?> update(UpdatePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.update(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.payers![0].payerId;
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

  Future<String?> delete(DeletePayerCommand command, String token) async {
    try {
      var service = PayerService();
      var result = await service.delete(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.payers![0].payerId;
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