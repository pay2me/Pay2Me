import 'package:flutter/material.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.orange,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pay2Me",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: 30),
            Text(
              "Itcom",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
