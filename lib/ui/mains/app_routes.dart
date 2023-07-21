import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/modules/export_modules.dart';

class AppRoutes {
  GlobalKey? navigatorKey;
  static const AUTH = '/';
  // static const AUTH_OR_HOME = '/';

  static const LOGIN = '/login';
  // static const SIGNUP = '/signup';

  static const INDEX = '/index';

  static const CREATEPAYERPAGE = '/createpayerpage';

  static Map<String, WidgetBuilder> routes = {
    AUTH: (ctx) => const LoginAuthPage(),
    // AUTH_OR_HOME: (ctx) => AuthOrIndexPage(),

    // LOGIN: (ctx) => LoginPage(),
    // // SIGNUP: (ctx) => const SignUpPage(),

    // INDEX: (ctx) => IndexPage(),

    CREATEPAYERPAGE: (ctx) => const CreatePayerPage(),
  };
}
