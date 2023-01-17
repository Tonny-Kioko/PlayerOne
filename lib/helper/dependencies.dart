import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/data/api/api_client.dart';
import 'package:playerone/data/controllers/auth_controller.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/data/controllers/location_controller.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/data/controllers/user_controller.dart';
import 'package:playerone/data/repository/auth_repository.dart';
import 'package:playerone/data/repository/location_repository.dart';

import 'package:playerone/data/repository/popular_games_repository.dart';
import 'package:playerone/data/repository/recommended_games_repository.dart';
import 'package:playerone/data/repository/user_repository.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/cart_repository.dart';

//Dependencies for the API clients
Future<void> init() async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();

  //For storing and retrieving data locally
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //API Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences:Get.find()));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

//Dependency for the repositories
  Get.lazyPut(() => PopularGamesRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedGamesRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

//Dependencies for controllers
  Get.lazyPut(() =>
      PopularGamesController(popularGamesRepo: Get.find(), apiClient: null));
  Get.lazyPut(() => RecommendedGamesController(
      recommendedGamesRepo: Get.find(), apiClient: null));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
