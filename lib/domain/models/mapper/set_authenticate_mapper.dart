class SetAuthenticateMapper {
  String? authName;
  String? authEmail;
  String? authRole;
  String? authToken;

  SetAuthenticateMapper({
    this.authName,
    this.authEmail,
    this.authRole,
    this.authToken,
  });

  SetAuthenticateMapper.MapFromJson(Map<String, dynamic> json) {
    authName = json['name'];
    authEmail = json['email'];
    authRole = json['role'];
    authToken = json['token'];
  }
}
