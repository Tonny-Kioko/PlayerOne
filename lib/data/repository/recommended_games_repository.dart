import 'package:get/get.dart';
import 'package:playerone/data/api/api_client.dart';
import 'package:playerone/utils/app_constants.dart';

class RecommendedGamesRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedGamesRepo({required this.apiClient});

  Future<Response> getRecommendedGamesList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_GAME_URI);


  }
}
