import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IAuthenticateService {
  Future<GetAuthenticateQuery> login(String email, String password);
  Future<int?> logout(String token);
  // Future<int?> signup(CreateClientCommand command);
}