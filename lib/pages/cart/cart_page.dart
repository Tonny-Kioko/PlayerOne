import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/pages/home/main_game_page.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/widgets/small_text.dart';

import '../../data/controllers/recommended_games_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.sizeBoxWidth5 * 3,
              right: Dimensions.sizeBoxWidth20,
              top: Dimensions.sizeBoxHeight50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                      icon: Icons.arrow_back_ios_new_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.iconSize15 * 3),
                  SizedBox(
                    width: Dimensions.sizeBoxWidth20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getinitial());
                    },
                    child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.iconSize15 * 3),
                  ),
                  AppIcon(
                      icon: Icons.shopping_basket_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.iconSize15 * 3)
                ],
              )),
          Positioned(
              top: Dimensions.sizeBoxHeight20 * 5,
              left: Dimensions.sizeBoxWidth20,
              right: Dimensions.sizeBoxWidth20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.sizeBoxHeight10),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 100,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var popularIndex =
                                          Get.find<PopularGamesController>()
                                              .popularGamesList
                                              .indexOf(_cartList[index].game!);

                                      if (popularIndex >= 0) {
                                        Get.toNamed(RouteHelper.getPopularGame(
                                            popularIndex, "cartpage"));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommendedGamesController>()
                                            .recommendedGamesList
                                            .indexOf(_cartList[index].game!);
                                        Get.toNamed(
                                            RouteHelper.getrecommendedGame(
                                                recommendedIndex, "cartpage"));
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.sizeBoxHeight20 * 5,
                                      height: Dimensions.sizeBoxHeight20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.sizeBoxHeight10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].image!),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.sizeBoxWidth10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: Dimensions.sizeBoxHeight20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(
                                          text: cartController
                                              .getItems[index].genre!,
                                          size: Dimensions.font20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SmallText(
                                              text: cartController
                                                  .getItems[index]!.price
                                                  .toString(),
                                              color: Colors.black54,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions
                                                      .sizeBoxHeight10,
                                                  bottom: Dimensions
                                                      .sizeBoxHeight10,
                                                  left:
                                                      Dimensions.sizeBoxWidth10,
                                                  right: Dimensions
                                                      .sizeBoxWidth10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20),
                                                  color: Colors.white),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      //popularGames.setQuantity(false);
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .game!,
                                                          -1);
                                                      print(
                                                          "I'm working just fine, pal!");
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions
                                                            .sizeBoxHeight10 /
                                                        2,
                                                  ),
                                                  SmallText(
                                                      text: _cartList[index]
                                                          .quantity!
                                                          .toString()), //popularGames.inCartItems.toString()),
                                                  SizedBox(
                                                    width: Dimensions
                                                            .sizeBoxHeight10 /
                                                        2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      //popularGames.setQuantity(true);
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .game!,
                                                          1);
                                                      print(
                                                          "I'm working just fine, pal!");
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ))
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

                      SizedBox(
                        width: Dimensions.sizeBoxHeight10 / 2,
                      ),
                      SmallText(text: popularGames.inCartItems.toString()),
                      SizedBox(
                        width: Dimensions.sizeBoxHeight10 / 2,
                      ),

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
                      //popularGames.addItem(game);
                    },
                    child: SmallText(
                      text: " | Add to Basket}",
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
