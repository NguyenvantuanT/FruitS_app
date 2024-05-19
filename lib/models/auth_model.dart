class AuthModel {
  String? name;
  String? email;
  String? pass;
  bool? isLogin;
  bool? isAdmin;

  AuthModel({
    this.name,
    this.email,
    this.pass,
    this.isLogin = false,
    this.isAdmin = false,
  });


  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel()
    ..name = json['name']
    ..email = json['email']
    ..pass = json['pass']
    ..isLogin = json['isLogin']
    ..isAdmin = json['isAdmin'];
  

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'pass': pass,
      'isLogin': isLogin,
      'isAdmin': isAdmin,
    };
  }
}

List<AuthModel> persons = [
  AuthModel()
    ..name = "Tuan"
    ..email = "tuan@gmail.com"
    ..pass = "123"
    ..isAdmin = true,
  AuthModel()
    ..name = "Tuan2"
    ..email = "tuan2@gmail.com"
    ..pass = "1234",
];
