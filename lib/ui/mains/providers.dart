import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/export_stores.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => LoginAuthStore()),
    ChangeNotifierProvider(create: (_) => ServicesAuthStore()),

    ChangeNotifierProvider(create: (_) => MainAuthOrIndexStore()),
    ChangeNotifierProvider(create: (_) => ServicesAuthOrIndexStore()),

    ChangeNotifierProvider(create: (_) => ServicesCardStore()),

    ChangeNotifierProvider(create: (_) => ServicesPayerStore()),
    ChangeNotifierProvider(create: (_) => MainPayerStore()),
    ChangeNotifierProvider(create: (_) => CreatePayerStore()),
    ChangeNotifierProvider(create: (_) => UpdatePayerStore()),
    ChangeNotifierProvider(create: (_) => DetailPayerStore()),

    ChangeNotifierProvider(create: (_) => ServicesProductStore()),
    ChangeNotifierProvider(create: (_) => MainProductStore()),
    ChangeNotifierProvider(create: (_) => CreateProductStore()),
    ChangeNotifierProvider(create: (_) => UpdateProductStore()),
    ChangeNotifierProvider(create: (_) => DetailProductStore()),

    ChangeNotifierProvider(create: (_) => MainIndexStore()),

    ChangeNotifierProvider(create: (_) => MainSearchStore()),
    ChangeNotifierProvider(create: (_) => ServicesSearchStore()),

    ChangeNotifierProvider(create: (_) => ServicesSubscriptionStore()),
  ];
}
