import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/mains/export_mains.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Pay2MeApp());
}

class Pay2MeApp extends StatelessWidget {
  const Pay2MeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: 'Semine',
        theme: CustomTheme.tema,
        routes: AppRoutes.routes,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
