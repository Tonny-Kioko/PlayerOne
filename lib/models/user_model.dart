class UserModel {
  int id;
  String name;
  String email;
  String phone;
  int orderCount;
  int itemsOrdered;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.orderCount,
    required this.itemsOrdered,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      orderCount: json['order_count'],
      itemsOrdered: json['items_ordered'],
    );
  }
}
