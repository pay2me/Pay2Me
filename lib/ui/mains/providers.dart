import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/export_stores.dart';

class Providers {
  static List<SingleChildWidget> providers = [

        ChangeNotifierProvider(create: (_) => LoginAuthStore()),
        ChangeNotifierProvider(create: (_) => ServicesAuthStore()),

        ChangeNotifierProvider(create: (_) => MainAuthOrIndexStore()),
        ChangeNotifierProvider(create: (_) => ServicesAuthOrIndexStore()),

        ChangeNotifierProvider(create: (_) => ServicesPayerStore()),
        ChangeNotifierProvider(create: (_) => MainPayerStore()),

        ChangeNotifierProvider(create: (_) => MainIndexStore()),

        ChangeNotifierProvider(create: (_) => MainSearchStore()),
        ChangeNotifierProvider(create: (_) => ServicesSearchStore()),
      ];
}
