class LoginUserCommand {
  String? userEmail;
  String? userPassword;

  LoginUserCommand({
    this.userEmail,
    this.userPassword,
  });

  Map<String, dynamic> MapToJson() => {
        'email': userEmail,
        'password': userPassword,
      };
}
