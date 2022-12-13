import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/routes/route_helper.dart';

import '../../data/controllers/popular_games-controller.dart';
import '../../data/controllers/recommended_games_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  _loadResources() async {
    await Get.find<PopularGamesController>().getPopularGamesList();
    await Get.find<RecommendedGamesController>().getRecommendedGamesList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    animation =
        CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut);
    Timer(Duration(seconds: 3), () => Get.offNamed(RouteHelper.getinitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/splashscreen.jpg"),
                fit: BoxFit.cover,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
