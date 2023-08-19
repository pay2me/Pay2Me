import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pay_2_me/domain/models/mapper/set_payer_mapper.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';

class PayerTile extends StatelessWidget {
  final SetPayerMapper payer;
  final int index;

  const PayerTile({
    required this.payer,
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

    DateTime expirationPlanDate = payer.payerService?.serviceExpirationPlanDate??DateTime.now().subtract(Duration(days: 1));
    DateTime subscriptionExpirationDate = payer.payerService?.serviceSubscriptionExpirationDate??DateTime.now().subtract(Duration(days: 1));

    bool isActivate = (expirationPlanDate.isAfter(DateTime.now()) && subscriptionExpirationDate.isAfter(DateTime.now())) ? true : false;

    final contrastColor = randomColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.DETAILPAYERPAGE,
          arguments: payer,
        );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          color: index%2 == 0 ? Colors.white : Color.fromARGB(255, 235, 235, 235),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: randomColor,
                    child: Text(
                      "${payer.payerName?[0]}",
                      style: TextStyle(
                        color: contrastColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Text("${payer.payerName}")),
                Expanded(child: Text("${payer.payerService?.serviceName}")),
                Expanded(
                  child: Text( isActivate
                    ? "Ativo"
                    : "Desativo",
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
