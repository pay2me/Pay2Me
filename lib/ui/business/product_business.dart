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

      return result.payers;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> create(CreateProductCommand command, String token) async {
    try {
      var service = ProductService();
      var result = await service.create(command, token);

      if (result == null) {
        throw const FormatException('Dados formularios invalidos.');
      }

      return true;
    } on FormatException catch (fe) {
      print(fe);
      return false;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> update(UpdateProductCommand command, String token) async {
    try {
      var service = ProductService();
      var result = await service.update(command, token);

      if (result == null) {
        throw const FormatException('Dados formularios invalidos.');
      }

      return true;
    } on FormatException catch (fe) {
      print(fe);
      return false;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> delete(DeleteProductCommand command, String token) async {
    try {
      var service = ProductService();
      var result = await service.delete(command, token);

      if (result == null) {
        throw const FormatException('Dados formularios invalidos.');
      }

      return result;
    } on FormatException catch (fe) {
      print(fe);
      return false;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
