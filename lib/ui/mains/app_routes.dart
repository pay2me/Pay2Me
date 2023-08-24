import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/modules/export_modules.dart';

class AppRoutes {
  GlobalKey? navigatorKey;
  static const AUTH_OR_HOME = '/';

  static const LOGIN = '/login';

  static const INDEX = '/index';

  static const CREATEPAYERPAGE = '/createpayerpage';
  static const DETAILPAYERPAGE = '/detailpayerpage';
  static const EDITPAYERPAGE = '/editpayerpage';

  static const CREATEPRODUCTPAGE = '/createproductpage';
  static const DETAILPRODUCTPAGE = '/detailproductpage';
  static const EDITPRODUCTPAGE = '/editproductpage';

  static Map<String, WidgetBuilder> routes = {
    AUTH_OR_HOME: (ctx) => const AuthOrIndexPage(),

    LOGIN: (ctx) => const LoginAuthPage(),

    INDEX: (ctx) => IndexPage(),

    CREATEPAYERPAGE: (ctx) => const CreatePayerPage(),
    DETAILPAYERPAGE: (ctx) => const DetailPayerPage(),
    EDITPAYERPAGE: (ctx) => const UpdatePayerPage(),

    CREATEPRODUCTPAGE: (ctx) => const CreateProductPage(),
    DETAILPRODUCTPAGE: (ctx) => const DetailProductPage(),
    EDITPRODUCTPAGE: (ctx) => const UpdateProductPage(),
  };
}
