import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/mains/app_routes.dart';
import 'package:pay_2_me/ui/modules/auth/stores/services_auth.store.dart';
import 'package:provider/provider.dart';

part 'login_auth.store.g.dart';

class LoginAuthStore = _LoginAuthStore with _$LoginAuthStore;

abstract class _LoginAuthStore with Store, ChangeNotifier {

  @observable
  bool isLoading = false;

  @observable
  bool isObscure = true;

  @observable
  SetUserMapper userToForm = SetUserMapper();

  @observable
  var formKey = GlobalKey<FormState>();

  Map<String, bool> validates = ObservableMap<String, bool>();

  @computed
  bool get formIsValid => formKey.currentState?.validate() ?? false;

  String? fieldValidator(String fieldName, dynamic value) {
    // value = value ?? "";
    // if (value.isEmpty) {
    //   return "$fieldName é obrigatorio";
    // }
    return null;
  }

  @action
  Future<void> submitLoginForm(BuildContext context) async {
    isLoading = true;

    if (!formIsValid) {
      isLoading = false;
      return;
    }

    formKey.currentState?.save();

    try {

      await Provider.of<ServicesAuthStore>(context, listen: false).login(userToForm);
      
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.INDEX,
      );
    
    } on FormatException catch (e) {
      
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Algo errado!'),
          content: Text(e.message),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );

    }

    userToForm = SetUserMapper();
    
    isLoading = false;
  }

  @action
  void changeObscure() {
    isObscure = !isObscure;
  }
}
