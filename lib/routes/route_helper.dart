import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/home/main_game_page.dart';

import '../pages/game/recommended_games_details.dart';

class RouteHelper{
static const String initial = "/";
static const String popularGame = "/popular-game";
static const String recommendedGame = "/recommended-game";


static String getinitial() => '$initial';
static String getPopularGame() => '$popularGame';
 static String getrecommendedGame() => '$recommendedGame';


static List<GetPage> routes = [
  GetPage(name: initial, page: () => MainGamePage()),

  GetPage(name: popularGame, page:() {
  return PopularGameDetail();
},
transition: Transition.fadeIn
),
GetPage(name: recommendedGame, page:() {
return RecommendedGameDetails();
},
    transition: Transition.fadeIn


)];
}