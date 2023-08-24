import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/infra/services/export_services.dart';

class ProductBusiness {
  Future<List<SetProductMapper>?> search(
    String token, {
    String? status,
    String? sortBy,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    try {
      var service = ProductService();
      var result = await service.search(
        token,
        status: status,
        sortBy: sortBy,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );

      if (result.code == 406) {
        throw const FormatException('Dados formularios invalidos.');
      }

      return result.products;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> create(CreateProductCommand command, String token) async {
    try {
      var service = ProductService();
      var result = await service.create(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.products![0].productId;
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

  Future<String?> update(UpdateProductCommand command, String token) async {
    try {
      var service = ProductService();
      var result = await service.update(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.products![0].productId;
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

  Future<String?> delete(DeleteProductCommand command, String token) async {
    try {
      var service = ProductService();
      var result = await service.delete(command, token);

      if(result.code != 200){
        throw const FormatException('Falha na criação');
      }

      return result.products![0].productId;
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
