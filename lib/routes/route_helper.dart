import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/home/main_game_page.dart';

class RouteHelper{
static const String initial = "/";
static const String popularGame = "/popular-game";
// static const String recommendedGame = "/recommended-game";

static List<GetPage> routes = [
  GetPage(name: "/", page: () => MainGamePage()),

  GetPage(name: popularGame, page:() => PopularGameDetail()),


];
}