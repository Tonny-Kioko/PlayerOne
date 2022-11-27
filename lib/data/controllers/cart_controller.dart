import 'package:get/get.dart';
import 'package:playerone/data/repository/cart_controller.dart';

import '../../models/cart_model.dart';
import '../../models/games_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItem(GameModel game, int quantity) {
    _items.putIfAbsent(game.id!, () => CartModel(
      quantity: quantity,
      isExist: true,
      time: DateTime.now().,
      name: game.name,
      id: game.id,
      image: game.image,
      price: game.price,
    ));
  }
}
