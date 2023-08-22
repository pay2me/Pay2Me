import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pay_2_me/domain/models/mapper/set_product_mapper.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';

class ProductTile extends StatelessWidget {
  final SetProductMapper product;
  final int index;

  const ProductTile({
    required this.product,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    Color randomColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    final contrastColor =
        randomColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.DETAILPRODUCTPAGE,
          arguments: product,
        );
      },
      child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            color: index % 2 == 0
                ? Colors.white
                : Color.fromARGB(255, 235, 235, 235),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: randomColor,
                      child: Text(
                        "${product.productDescription?[0]}",
                        style: TextStyle(
                          color: contrastColor,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Text("${product.productDescription}")),
                  Expanded(child: Text("${product.productPrice}")),
                  Expanded(
                    child: Text(
                      product.productStatus == "actived" ? "Ativo" : "Desativo",
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
