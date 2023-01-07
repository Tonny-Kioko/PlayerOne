class LoginBody {
  String email;
  String password;

  LoginBody({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["email"] = this.email;
    data["password"] = this.password;

    return data;
  }
}
