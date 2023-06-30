import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginAuthPage extends StatelessWidget {
  const LoginAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pay2Me"),
                    Text("Itcom"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text("Login"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
