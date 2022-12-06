import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/models/games_model.dart';
import 'package:playerone/pages/home/main_game_page.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/expandable_text.dart';

import '../../colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import '../cart/cart_page.dart';

class PopularGameDetail extends StatelessWidget {
  final int pageId;
  const PopularGameDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var game = Get.find<PopularGamesController>().popularGamesList[pageId];
    Get.find<PopularGamesController>()
        .initData(game, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.populaarGameImageSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            AppConstants.BASE_URL+AppConstants.UPLOAD_URL+game.image!))),
              )),
          //Icons
          Positioned(
              top: Dimensions.sizeBoxHeight50,
              left: Dimensions.sizeBoxWidth20,
              right: Dimensions.sizeBoxWidth20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => MainGamePage());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios_new_outlined)),
                  GetBuilder<PopularGamesController>(builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_basket_outlined),
                        Get.find<PopularGamesController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap:(){
                                  Get.to(() => CartPage());
                                },
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 2,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                ),
                              )
                            : Container(),
                        Get.find<PopularGamesController>().totalItems >= 1
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: SmallText(
                                  text: Get.find<PopularGamesController>()
                                      .totalItems
                                      .toString(),
                                ),
                              )
                            : Container()
                      ],
                    );
                  })
                ],
              )),
          //Intro about the game displayed
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.populaarGameImageSize - 5,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.sizeBoxWidth20,
                      right: Dimensions.sizeBoxWidth20,
                      top: Dimensions.sizeBoxHeight20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: game.name!,
                        genre: game.genre!,
                      ),
                      SizedBox(
                        height: Dimensions.sizeBoxHeight20,
                      ),
                      BigText(text: "About"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                            text: game.description!
                          ),
                        ),
                      )
                    ],
                  )))
          //An expandable widget with about section
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularGamesController>(
        builder: (popularGames) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.sizeBoxHeight20,
                bottom: Dimensions.sizeBoxHeight20,
                right: Dimensions.sizeBoxWidth10),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizeBoxHeight20,
                      bottom: Dimensions.sizeBoxHeight20,
                      left: Dimensions.sizeBoxWidth20,
                      right: Dimensions.sizeBoxWidth20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularGames.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.sizeBoxHeight10 / 2,
                      ),
                      SmallText(text: popularGames.inCartItems.toString()),
                      SizedBox(
                        width: Dimensions.sizeBoxHeight10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularGames.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizeBoxHeight20,
                      bottom: Dimensions.sizeBoxHeight20,
                      left: Dimensions.sizeBoxWidth20,
                      right: Dimensions.sizeBoxWidth20),
                  child: GestureDetector(
                    onTap: () {
                      popularGames.addItem(game);
                    },
                    child: SmallText(
                      text: "\$ ${game.price!} | Add to Basket}",
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
