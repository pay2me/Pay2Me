import 'package:firebase_auth/firebase_auth.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';

class AuthenticateService implements IAuthenticateService {
  @override
  Future<GetAuthenticateQuery> login(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    Map<String, dynamic> json = {
      'id': credential.user?.uid,
      'name': credential.user?.displayName,
      'email': credential.user?.email,
      'token': credential.user?.refreshToken,
    };

    return GetAuthenticateQuery.MapFromJson(json);
  }

  @override
  Future<GetAuthenticateQuery> signup(String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Map<String, dynamic> json = {
      'id': credential.user?.uid,
      'name': credential.user?.displayName,
      'email': credential.user?.email,
      'token': credential.user?.refreshToken,
    };

    return GetAuthenticateQuery.MapFromJson(json);
  }

  @override
  Future<bool> logout() async {
    await FirebaseAuth.instance.signOut();
    return isAutheticate();
  }

  @override
  Future<bool> isAutheticate() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if(currentUser == null) true;
    return false;
  }
}
