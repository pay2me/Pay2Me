class SetUserMapper {
  String? userId;
  String? userName;
  String? userLogin;
  String? userPassword;

  SetUserMapper({
    this.userId,
    this.userName,
    this.userLogin,
    this.userPassword,
  });

  SetUserMapper.MapFromJson(Map<String, dynamic> json) {
    userId = json['id'];
    userName = json['name'];
    userLogin = json['login'];
    userPassword = json['password'];
  }
}
