import 'package:flutter/material.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.orange,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pay2Me",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 30),
          Text(
            "Itcom",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
