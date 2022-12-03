import 'package:get/get.dart';
import 'package:playerone/data/repository/cart_controller.dart';

import '../../models/cart_model.dart';
import '../../models/games_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItem(GameModel game, int quantity) {
    if (_items.containsKey(game.id!)) {
      _items.update(game.id!, (value) {
        return CartModel(
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          name: value.name,
          id: value.id,
          image: value.image,
          price: value.price,
        );
      });

    } else {
      _items.putIfAbsent(game.id!, () =>
          CartModel(
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            name: game.name,
            id: game.id,
            image: game.image,
            price: game.price,
          ));
    }
  }

  bool existInCart(GameModel game){
    if(_items.containsKey(game.id)){
      return true;
    }
    return false;
  }

  getQuantity(GameModel game){
    var quantity = 0;
    if(_items.containsKey(game.id)){
      _items.forEach((key, value) {
        if(key== game.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
