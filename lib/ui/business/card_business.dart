import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';

class CardBusiness {

  Future<List<SetCardMapper>?> search(
    String token, 
    {
      String? payerId, 
      String? brand, 
      String? expiration, 
      String? expirationStart,
      String? expirationEnd,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  ) async {
    try {
      var service = CardService();
      var result = await service.search(
        token,
        payerId: payerId,
        brand: brand,
        expiration: expiration,
        expirationStart: expirationStart,
        expirationEnd: expirationEnd,
        sortBy: sortBy,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );

      if(result.code != 200){
        throw const FormatException('Falha na busca');
      }

      return result.cards;
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

  Future<String?> create(CreateCardCommand command, String token) async {
    try {
      var service = CardService();
      var result = await service.create(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.cards![0].cardId;
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

  Future<String?> delete(DeleteCardCommand command, String token) async {
    try {
      var service = CardService();
      var result = await service.delete(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.cards![0].cardId;
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