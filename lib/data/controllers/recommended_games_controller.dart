import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../models/games_model.dart';
import '../repository/recommended_games_repository.dart';

class RecommendedGamesController extends GetxController {
  final RecommendedGamesRepo recommendedGamesRepo;
  RecommendedGamesController({required this.recommendedGamesRepo, required apiClient});

  List<dynamic> get recommendedGamesList => _recommendedGamesList;
  List<dynamic> _recommendedGamesList = [];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedGamesList() async {
    Response response = await recommendedGamesRepo.getRecommendedGamesList();
    if (response.statusCode == 200) {
      _isLoaded=true;
      print("We're working just fine");
      print(_recommendedGamesList);
      _recommendedGamesList = [];
      _recommendedGamesList.addAll(Game.fromJson(response.body).games);

      update();
    } else {}
  }
}
