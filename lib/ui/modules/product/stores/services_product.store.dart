import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/business/product_business.dart';
import 'package:pay_2_me/ui/modules/index/stores/main_index.store.dart';

part 'services_product.store.g.dart';

class ServicesProductStore = _ServicesProductStore with _$ServicesProductStore;

abstract class _ServicesProductStore with Store, ChangeNotifier {
  //  Business

  final productBusiness = ProductBusiness();

  // GETS

  Future<List<SetProductMapper>> searchProducts(
    BuildContext context, {
    String? status,
    String? sortBy,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    return (await productBusiness.search(
          token,
          status: status,
          sortBy: sortBy,
          orderBy: orderBy,
          limit: limit,
          offset: offset,
        )) ??
        [];
  }

  // CRUD

  Future<String?> createProduct(BuildContext context, SetProductMapper product) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    CreateProductCommand createProductCommand = CreateProductCommand(
      productDescription: product.productDescription,
      productPrice: product.productPrice,
      productStatus: "actived",
    );

    return (await productBusiness.create(createProductCommand, token));
  }

  Future<String?> updateProduct(BuildContext context, SetProductMapper product) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    UpdateProductCommand editProductCommand = UpdateProductCommand(
      productId: product.productId,
      productDescription: product.productDescription,
      productFixedPrice: product.productFixedPrice,
      productPrice: product.productPrice,
      productStatus: product.productStatus,
    );

    return (await productBusiness.update(editProductCommand, token));
  }

  Future<String?> deleteProduct(BuildContext context, SetProductMapper product) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    DeleteProductCommand deleteProductCommand = DeleteProductCommand(
      productId: product.productId,
    );

    return (await productBusiness.delete(deleteProductCommand, token));
  }
}
