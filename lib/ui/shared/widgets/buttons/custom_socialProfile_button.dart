import 'package:flutter/material.dart';

class CustomSocialProfileButton extends StatelessWidget {
  final String? imagePath;
  final String? label;
  final void Function()? onPressed;

  CustomSocialProfileButton({
    this.imagePath,
    this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(10),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      imagePath!,
                      height: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Entrar com ${label!}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02)
                  ],
                ),
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
