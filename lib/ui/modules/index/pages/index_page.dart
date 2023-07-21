import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/modules/index/export_index.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/export_modules.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_load_scaffold.dart';

class IndexPage extends StatelessWidget {
  final _pageController = PageController();

  IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainIndexStore>(context, listen: false);

    return FutureBuilder(
      future: store.init(context),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? CustomLoadScaffold()
              : PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PayerTab(),
                  ],
                ),
    );
  }
}
