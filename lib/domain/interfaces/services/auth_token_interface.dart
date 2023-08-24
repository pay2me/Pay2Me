import 'package:pay_2_me/domain/models/export_models.dart';

abstract class IAuthTokenService {
  Future<GetAuthTokenQuery> getAuthToken();
}
