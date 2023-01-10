import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/pages/auth/sign_in_page.dart';
import 'package:playerone/pages/auth/sign_up_page.dart';
import 'package:playerone/pages/cart/cart_page.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/game/recommended_games_details.dart';
import 'package:playerone/pages/home/game_page_body.dart';
import 'package:playerone/pages/home/main_game_page.dart';
import 'package:playerone/helper/dependencies.dart' as dep;
import 'package:playerone/pages/splashScreen/spash_page.dart';
import 'package:playerone/routes/route_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularGamesController>(
      builder: (_) {
        return GetBuilder<RecommendedGamesController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            //home: SignInPage(),


            // home: SplashScreen(),



            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        });
      },
    );
  }
}
