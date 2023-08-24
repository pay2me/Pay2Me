class SetAuthTokenMapper {
  String? token;

  SetAuthTokenMapper({
    this.token,
  });

  SetAuthTokenMapper.MapFromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
