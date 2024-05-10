class AuthModel {
  String? name;
  String? email;
  String? pass;
  bool? isLogin;

  AuthModel({
    this.name,
    this.email,
    this.pass,
    this.isLogin = false,
  });
}

List<AuthModel> persons = [
  AuthModel()
    ..name = "Tuan"
    ..email = "tuan@gmail.com"
    ..pass = "123",
  AuthModel()
    ..name = "Tuan2"
    ..email = "tuan2@gmail.com"
    ..pass = "1234",
];
