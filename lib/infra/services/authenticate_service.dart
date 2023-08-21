import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pay_2_me/domain/interfaces/services/auth_token_interface.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';

import '../configs/settings.dart';

class AuthenticateService implements IAuthenticateService, IAuthTokenService {
  @override
  Future<GetAuthenticateQuery> login(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    final token = (await getAuthToken()).authToken!.token;

    Map<String, dynamic> json = {
      'id': credential.user?.uid,
      'name': credential.user?.displayName,
      'email': credential.user?.email,
      'token': token,
    };

    return GetAuthenticateQuery.MapFromJson(json);
  }

  @override
  Future<GetAuthenticateQuery> signup(String email, String password) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

    if (currentUser == null) true;
    return false;
  }

  @override
  Future<GetAuthTokenQuery> getAuthToken() async {
    var url = "${Settings.cobreFacilEndPoint}/authenticate";
    // try {
    var response = await Dio().post(
      url,
      data: {
        "app_id": Settings.appId,
        "secret": Settings.secret,
      },
    );
    return GetAuthTokenQuery.MapFromResponse(response);
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
    // return GetAuthTokenQuery();
  }
}
