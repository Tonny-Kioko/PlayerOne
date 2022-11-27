import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/repository/popular_games_repository.dart';

import '../../models/games_model.dart';
import 'cart_controller.dart';

class PopularGamesController extends GetxController {
  final PopularGamesRepo popularGamesRepo;
  PopularGamesController({required this.popularGamesRepo, required apiClient});

  List<GameModel> get popularGamesList => _popularGamesList;
  List<GameModel> _popularGamesList = [];
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularGamesList() async {
    Response response = await popularGamesRepo.getPopularGamesList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      print("We're working just fine");
      print(_popularGamesList);
      _popularGamesList = [];
      _popularGamesList.addAll(Game.fromJson(response.body).games);

      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      //Games increment in basket
      _quantity = checkQuantity(_quantity + 1);
    } else {
      //Games deleted from basket
      _quantity = checkQuantity(_quantity - 1);
    }
    //Recognise an increase or decrease in the cart
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Basket Items",
        "Feed me more...",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 100) {
      Get.snackbar(
        "Basket Items",
        "I'm already full!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 100;
    } else {
      return quantity;
    }
  }

  void initData(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    //Recovering stored item count and adding to new count
  }

  void addItem(GameModel game) {
    _cart.addItem(game, _quantity);
  }
}
