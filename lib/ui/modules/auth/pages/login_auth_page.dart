import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';

class LoginAuthPage extends StatelessWidget {
  LoginAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Observer(
      builder: (context) => Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
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
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 30),
                    ),
                    Form(
                      key: _formKey,
                      child: const Column(
                        children: [
                          LoginTextInput(
                            hintText: 'Insira seu email',
                            shouldProtect: false,
                          ),
                          LoginTextInput(
                            hintText: 'Insira sua senha',
                            shouldProtect: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.of(context).pushNamed(AppRoutes.INDEX);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTextInput extends StatelessWidget {
  const LoginTextInput({
    required this.hintText,
    required this.shouldProtect,
  });

  final String hintText;
  final bool shouldProtect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: shouldProtect,
    );
  }
}
