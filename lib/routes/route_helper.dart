import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/home/main_game_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/game/recommended_games_details.dart';

class RouteHelper{
static const String initial = "/";
static const String popularGame = "/popular-game";
static const String recommendedGame = "/recommended-game";
static const String cartPage = "/cart-page";


static String getinitial() => '$initial';
static String getPopularGame(int pageId) => '$popularGame? pageId = $pageId';
static String getrecommendedGame(int pageId) => '$recommendedGame? pageId = $pageId';
static String getCartPage() => '$cartPage';


static List<GetPage> routes = [
  GetPage(name: initial, page: () => MainGamePage()),

  GetPage(name: popularGame, page:() {
    var pageId = Get.parameters['pageId'];
  return PopularGameDetail(pageId: int.parse(pageId!));
},
transition: Transition.fadeIn
),
  GetPage(name: cartPage, page: (){
    return CartPage();
  },
    transition: Transition.fadeIn
  ),
GetPage(name: recommendedGame, page:() {
  var pageId = Get.parameters['pageId'];
return RecommendedGameDetails(pageId: int.parse(pageId!))
;
},
    transition: Transition.fadeIn


)];
}