import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/modules/export_modules.dart';

class AppRoutes {
  GlobalKey? navigatorKey;
  static const AUTH_OR_HOME = '/';

  static const LOGIN = '/login';
  // static const SIGNUP = '/signup';

  static const INDEX = '/index';

  static Map<String, WidgetBuilder> routes = {
    // AUTH_OR_HOME: (ctx) => AuthOrIndexPage(),

    // LOGIN: (ctx) => LoginPage(),
    // // SIGNUP: (ctx) => const SignUpPage(),

    // INDEX: (ctx) => IndexPage(),
  };
}
