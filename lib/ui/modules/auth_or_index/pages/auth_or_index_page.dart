import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/auth/pages/login_auth_page.dart';
import 'package:pay_2_me/ui/modules/auth_or_index/export_auth_or_index.dart';
import 'package:pay_2_me/ui/modules/index/pages/index_page.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_load_scaffold.dart';

class AuthOrIndexPage extends StatelessWidget {
  const AuthOrIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainAuthOrIndexStore>(context, listen: false);
    
    return FutureBuilder(
      future: store.loadAutoLogin(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadScaffold();
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return store.isAuth ? IndexPage() : const LoginAuthPage();
        }
      },
    );
  }
}
