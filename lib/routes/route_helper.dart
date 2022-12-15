import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/home/homepage.dart';
import 'package:playerone/pages/home/main_game_page.dart';
import 'package:playerone/pages/splashScreen/spash_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/game/recommended_games_details.dart';

class RouteHelper{
static const String initial = "/";
static const String popularGame = "/popular-game";
static const String recommendedGame = "/recommended-game";
static const String cartPage = "/cart-page";
static const String splashPage = "/splash-page";



static String getinitial() => '$initial';
static String getPopularGame(int pageId, String page) => '$popularGame? pageId = $pageId &page = $page';
static String getrecommendedGame(int pageId, String page) => '$recommendedGame? pageId = $pageId &page = $page';
static String getCartPage() => '$cartPage';
static String getSplashPage() => '$splashPage';


static List<GetPage> routes = [
  GetPage(name: initial, page: () => HomePage()),
  GetPage(name: splashPage, page: ()=> SplashScreen()),

  GetPage(name: popularGame, page:() {
    var pageId = Get.parameters['pageId'];
    var page = Get.parameters['page'];
  return PopularGameDetail(pageId: int.parse(pageId!),page: page!);
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
  var page = Get.parameters['page'];
return RecommendedGameDetails(pageId: int.parse(pageId!), page: page!)
;
},
    transition: Transition.fadeIn


)];
}