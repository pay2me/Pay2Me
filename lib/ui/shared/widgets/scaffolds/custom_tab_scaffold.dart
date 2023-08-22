import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/modules/drawer/widgets/custom_drawer_widget.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';

class CustomTabScaffold extends StatelessWidget {
  final String title;
  final PageController? pageController;
  final List<Widget>? actionsAppBar;
  final Widget? body;
  final Widget? bottomSheet;

  const CustomTabScaffold({
    required this.title,
    this.pageController,
    this.body,
    this.bottomSheet,
    this.actionsAppBar,
    Key? key,
  }) : super(key: key);

  Future<bool> onWillPop(BuildContext context) async {
    if (title == "Pagadores") {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Você tem certeza?'),
          content: const Text('Você irá sair do app'),
          actions: <Widget>[
            TextButton(
              child: const Text('Não'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text('Sim'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ) as bool;
    } else {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.INDEX,
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
          actions: actionsAppBar,
          iconTheme: Theme.of(context).iconTheme,
        ),
        drawer:
            pageController != null ? CustomDrawerWidget(pageController) : null,
        body: body,
        bottomSheet: bottomSheet,
      ),
    );
  }
}
