import 'package:get/get.dart';
import 'package:playerone/data/api/api_client.dart';
import 'package:playerone/utils/app_constants.dart';

class PopularGamesRepo extends GetxService {
  final ApiClient apiClient;
  PopularGamesRepo({required this.apiClient});

  Future<Response> getPopularGamesList() async {
    return await apiClient.getData(AppConstants.POPULAR_GAME_URI);
  }
}
