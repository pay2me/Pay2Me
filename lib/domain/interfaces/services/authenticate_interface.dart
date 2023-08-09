import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IAuthenticateService {
  Future<GetAuthenticateQuery> login(String email, String password);
  Future<GetAuthenticateQuery> signup(String email, String password);
  Future<bool> logout();
  Future<bool> isAutheticate();
}