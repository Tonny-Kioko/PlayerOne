import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/widgets/small_text.dart';

import '../../data/controllers/popular_games-controller.dart';
import '../../data/controllers/recommended_games_controller.dart';
import 'game_page_body.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  _MainGamePage createState() => _MainGamePage();
}

class _MainGamePage extends State<MainGamePage> {
  Future<void> _loadResources() async {
    await Get.find<PopularGamesController>().getPopularGamesList();
    await Get.find<RecommendedGamesController>().getRecommendedGamesList();
  }

  @override
  Widget build(BuildContext context) {
    // print("Sreen heigt is "+MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 49, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Ready, Player One",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Featured Games",
                              color: Colors.black54,
                            ),
                            Icon(Icons.gamepad_outlined),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                          width: 45,
                          height: 45,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.mainColor,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: GamePageBody(),
            )),
          ],
        ),
        onRefresh: _loadResources);
  }
}
