import 'package:pay_2_me/domain/models/mapper/set_user_mapper.dart';

class SetAuthenticateMapper {
  SetUserMapper? authUser;
  String? authToken;

  SetAuthenticateMapper({
    this.authUser,
    this.authToken,
  });

  SetAuthenticateMapper.MapFromJson(Map<String, dynamic> json) {
    authUser = SetUserMapper.MapFromJson(json);
    authToken = json['token'];
  }

  bool isIncomplete() {
    if (authUser == null || authToken == null) return true;
    return false;
  }
}
