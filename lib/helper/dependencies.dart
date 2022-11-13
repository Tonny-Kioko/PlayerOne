import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/data/api/api_client.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/repository/popular_games_repository.dart';
import 'package:playerone/utils/app_constants.dart';

//Dependencies for the API clients
Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.POPULAR_GAME_URI));

//Dependency for the repositories
  Get.lazyPut(() => PopularGamesRepo(apiClient: Get.find()));

//Dependencies for controllers
  Get.lazyPut(() =>
      PopularGamesController(popularGamesRepo: Get.find(), apiClient: null));
}
