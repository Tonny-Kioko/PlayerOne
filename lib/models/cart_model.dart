class CartModel {
  int? id;
  String? name;
  int? quantity;
  int? price;
  bool? isExist;
  String? image;
  String? time;

  CartModel({
    this.quantity,
    this.isExist,
    this.time,
    this.name,
    this.id,
    this.image,
    this.price,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    time = json['time'];
    price = json['price'];
    isExist = json['isExist'];
    image = json['image'];
  }
}
