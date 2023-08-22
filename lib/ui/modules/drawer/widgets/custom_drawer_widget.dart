import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/drawer/tiles/drawer_tile.dart';
import 'package:pay_2_me/ui/modules/index/export_index.dart';

class CustomDrawerWidget extends StatelessWidget {
  final PageController? pageController;

  const CustomDrawerWidget(this.pageController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainIndexStore>(context, listen: false);
    imageCache.clear();

    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white70,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, bottom: 5, top: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("./assets/images/app/icon.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Olá, ${store.storegeAuthData.authUser?.userEmail}",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerTile(Icons.home, "Pagadores", pageController, 0),
                      DrawerTile(Icons.shopping_cart_outlined, "Produtos",
                          pageController, 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
