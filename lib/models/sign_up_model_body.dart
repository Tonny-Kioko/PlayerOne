class SignUpBody {
  String name;
  String phone;
  String email;
  String password;
  String confirmPassword;

  SignUpBody(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.password;
    data["confirmPassword"] = this.confirmPassword;
    return data;
  }
}
