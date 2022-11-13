import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:playerone/data/repository/popular_games_repository.dart';

import '../../models/games_model.dart';

class PopularGamesController extends GetxController {
  final PopularGamesRepo popularGamesRepo;
  PopularGamesController({required this.popularGamesRepo, required apiClient});

  List<dynamic> get popularGamesList => _popularGamesList;
  List<dynamic> _popularGamesList = [];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularGamesList() async {
    Response response = await popularGamesRepo.getPopularGamesList();
    if (response.statusCode == 200) {
      _isLoaded=true;
      print("We're working just fine");
      print(_popularGamesList);
      _popularGamesList = [];
      _popularGamesList.addAll(Game.fromJson(response.body).games);

      update();
    } else {}
  }
}
