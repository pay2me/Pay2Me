import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/product/export_product.dart';

part 'detail_product.store.g.dart';

class DetailProductStore = _DetailProductStore with _$DetailProductStore;

abstract class _DetailProductStore with Store, ChangeNotifier {
  @observable
  bool isLoading = false;

  @observable
  List<String> permissions = [];

  @observable
  SetProductMapper productToDetail = SetProductMapper();

  @observable
  bool changeEnable = false;

  @action
  Future<void> loadDataProduct(
      BuildContext context, SetProductMapper product) async {
    isLoading = true;

    productToDetail = product;

    isLoading = false;
  }

  @action
  Future<void> confirmAndDeleteProduct(
      BuildContext context, SetProductMapper product) async {
    bool isDelete = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Você tem certeza?'),
            content: Text(
                'Você irá deletar permanentemente o produto com o nome:\n${product.productDescription}'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Sim'),
              ),
            ],
          ),
        ) ??
        false;

    if (isDelete) {
      isLoading = true;

      String? productDeletedId = await Provider.of<ServicesProductStore>(context, listen: false).deleteProduct(context, product);
      showMessage(context, (productDeletedId != null));

      if (productDeletedId == null) {
        await Provider.of<MainProductStore>(context, listen: false)
            .loadProducts(context);
        Navigator.of(context).pop();
      }

      isLoading = false;
    }
  }

  void showMessage(BuildContext context, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          isSuccess
              ? "Produto deletado com sucesso!"
              : "Produto não foi deletado!",
        ),
      ),
    );
  }
}
