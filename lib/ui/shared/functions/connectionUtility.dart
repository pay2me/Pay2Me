import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

class ConnectionUtility {
  Future<bool> getConnection() async {
    try {
      final result = await http.get(Uri.parse('https://github.com'));
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
