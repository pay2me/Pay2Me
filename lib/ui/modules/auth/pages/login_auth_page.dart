import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/ui/modules/auth/export_auth.dart';
import 'package:pay_2_me/ui/modules/auth/stores/login_auth.store.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_textFormField_field.dart';
import 'package:provider/provider.dart';

class LoginAuthPage extends StatelessWidget {
  const LoginAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LoginAuthStore>(context, listen: false);

    return Observer(
      builder: (context) => Scaffold(
        body: Row(
          children: [
            const Expanded(
              flex: 2,
              child: LogoAuthWidget(),
            ),
            Expanded(
              flex: 3,
              child: Form(
                key: store.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      CustomTextFormField(
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email),
                        onSaved: (email) => store.userToForm.userEmail = email,
                        validator: (email) => store.fieldValidator("Email", email),
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.password),
                        obscureText: store.isObscure,
                        onSaved: (password) => store.userToForm.userPassword = password,
                        validator: (password) => store.fieldValidator("Senha", password),
                        suffixIcon: IconButton(
                          icon: store.isObscure
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                          onPressed: store.changeObscure,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.all(10),
                          fixedSize: const Size(100, 40),
                        ),
                        child: store.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                        onPressed: () async => await store.submitLoginForm(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
