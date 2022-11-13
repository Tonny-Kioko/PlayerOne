import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/game/recommended_games_details.dart';
import 'package:playerone/pages/home/game_page_body.dart';
import 'package:playerone/pages/home/main_game_page.dart';
import 'package:playerone/helper/dependencies.dart' as dep;

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
    Get.find<PopularGamesController>().getPopularGamesList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainGamePage(),
    );
  }
}

