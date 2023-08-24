import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';

class SubscriptionBusiness {

  Future<List<SetSubscriptionMapper>?> search(String token) async {
    try {
      var service = SubscriptionService();
      var result = await service.search(token);

      if(result.code != 200){
        throw const FormatException('Falha na busca');
      }

      return result.subscriptions;
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

  Future<String?> create(CreateSubscriptionCommand command, String token) async {
    try {
      var service = SubscriptionService();
      var result = await service.create(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.subscriptions![0].subscriptionId;
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

  Future<String?> update(UpdateSubscriptionCommand command, String token) async {
    try {
      var service = SubscriptionService();
      var result = await service.update(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.subscriptions![0].subscriptionId;
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

  Future<String?> delete(DeleteSubscriptionCommand command, String token) async {
    try {
      var service = SubscriptionService();
      var result = await service.delete(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.subscriptions![0].subscriptionId;
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