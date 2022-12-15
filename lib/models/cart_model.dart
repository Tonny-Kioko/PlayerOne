
import 'package:playerone/models/games_model.dart';

class CartModel {
  int? id;
  String? name;
  int? quantity;
  int? price;
  bool? isExist;
  String? image;
  String? time;
  String? genre;
  GameModel? game;

  CartModel(
      {this.genre,
      this.quantity,
      this.isExist,
      this.time,
      this.name,
      this.id,
      this.image,
      this.price,
      this.game});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    time = json['time'];
    price = json['price'];
    isExist = json['isExist'];
    image = json['image'];
    genre = json['genre'];
    game = GameModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "image": this.image,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
    };
  }
}
