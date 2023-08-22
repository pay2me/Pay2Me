import 'package:pay_2_me/infra/services/storege_service.dart';

class StoregeBusiness {
  Future<bool?> saveString(String key, String value) async {
    try {
      var result = await StoregeServices.saveString(key, value);

      return result;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool?> saveMap(String key, Map<String, dynamic> value) async {
    try {
      var result = await StoregeServices.saveMap(key, value);

      return result;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> getString(String key, [String defaultValue = '']) async {
    try {
      var result = await StoregeServices.getString(key, defaultValue);

      return result;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    try {
      var result = await StoregeServices.getMap(key);

      return result;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool?> remove(String key) async {
    try {
      var result = await StoregeServices.remove(key);

      return result;
    } on FormatException catch (fe) {
      print(fe);
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
