import 'package:dio/dio.dart';

class ConnectionUtility {
  Future<bool> getConnection() async {
    try {
      final result = await Dio().get('https://google.com');
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
