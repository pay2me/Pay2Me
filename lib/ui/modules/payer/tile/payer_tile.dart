import 'package:flutter/material.dart';
import 'package:pay_2_me/domain/models/mapper/set_payer_mapper.dart';

class PayerTile extends StatelessWidget {
  final SetPayerMapper payer;
  final bool? isAdmin;

  const PayerTile({
    required this.payer,
    this.isAdmin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   AppRoutes.DETAILPAYERPAGE,
        //   arguments: [
        //     payer,
        //     isAdmin,
        //   ],
        // );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(payer.payerName??""),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Divider(
                endIndent: 20,
                thickness: 3,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
