class SetUserMapper {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;

  SetUserMapper({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
  });

  SetUserMapper.MapFromJson(Map<String, dynamic> json) {
    userId = json['id'];
    userName = json['name'];
    userEmail = json['email'];
    userPassword = json['password'];
  }
}
