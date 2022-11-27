import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/data/api/api_client.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/data/repository/cart_controller.dart';
import 'package:playerone/data/repository/popular_games_repository.dart';
import 'package:playerone/data/repository/recommended_games_repository.dart';
import 'package:playerone/utils/app_constants.dart';

//Dependencies for the API clients
Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

//Dependency for the repositories
  Get.lazyPut(() => PopularGamesRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedGamesRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

//Dependencies for controllers
  Get.lazyPut(() =>
      PopularGamesController(popularGamesRepo: Get.find(), apiClient: null));
  Get.lazyPut(() =>
      RecommendedGamesController(recommendedGamesRepo: Get.find(), apiClient: null));
  Get.lazyPut(() =>
      CartController(cartRepo : Get.find()));

}
