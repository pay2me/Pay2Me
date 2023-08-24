import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/domain/models/mapper/set_product_mapper.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';
import 'package:pay_2_me/ui/modules/product/stores/detail_product.store.dart';
import 'package:pay_2_me/ui/shared/widgets/tiles/custom_detail_tile.dart';
import 'package:provider/provider.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DetailProductStore>(context, listen: false);

    final SetProductMapper product =
        ModalRoute.of(context)!.settings.arguments as SetProductMapper;

    return FutureBuilder(
      future: store.loadDataProduct(context, product),
      builder: (ctx, snapshot) => Observer(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Produto"),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  size: 30,
                ),
                onPressed: () => store.confirmAndDeleteProduct(context, product),
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  AppRoutes.EDITPRODUCTPAGE,
                  arguments: product,
                ),
              ),
            ],
            iconTheme: Theme.of(context).iconTheme,
          ),
          body: snapshot.connectionState == ConnectionState.waiting || store.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informações do Produto",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.shadow,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDetailTile(
                                detailName: "Nome",
                                detailData: store.productToDetail.productDescription,
                              ),
                              CustomDetailTile(
                                detailName: "Preço",
                                detailData: store.productToDetail.productPrice,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
