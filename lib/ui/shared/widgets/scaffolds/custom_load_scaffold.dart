import 'package:flutter/material.dart';

class CustomLoadScaffold extends StatelessWidget {
  final String? text;

  const CustomLoadScaffold({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app/icon.png",
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.30,
            ),
            if(text != null)
              Text(text!),
          ],
        ),
      ),
    );
  }
}
