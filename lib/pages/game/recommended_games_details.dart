import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/routes/route_helper.dart';
import '../../data/controllers/cart_controller.dart';
import '../../widgets/small_text.dart';

class RecommendedGameDetails extends StatelessWidget {
  final int pageId;
  RecommendedGameDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var game =
        Get.find<RecommendedGamesController>().recommendedGamesList[pageId];
    Get.find<PopularGamesController>()
        .initData(game, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getinitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                //AppIcon(icon: Icons.shopping_basket)
                GetBuilder<PopularGamesController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_basket_outlined),
                      Get.find<PopularGamesController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
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
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: Container(
                child: Center(
                    child: BigText(size: Dimensions.font26, text: game.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20))),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.white70,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + game.image!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.sizeBoxWidth20,
                right: Dimensions.sizeBoxWidth20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.sizeBoxWidth10,
                        right: Dimensions.sizeBoxWidth10),
                    child: Text(game.description),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularGamesController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.sizeBoxWidth20 * 2,
                    right: Dimensions.sizeBoxWidth20 * 2,
                    top: Dimensions.sizeBoxHeight10,
                    bottom: Dimensions.sizeBoxHeight10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                        text: "\$${game.price!} * ${controller.inCartItems}",
                        color: AppColors.mainBlackColor),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add,
                        iconColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: Dimensions.bottomHeightBar,
                padding: EdgeInsets.only(
                    top: Dimensions.sizeBoxHeight10,
                    bottom: Dimensions.sizeBoxHeight10,
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white),
                      child: Icon(
                        Icons.thumb_up,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(game);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.sizeBoxHeight20,
                            bottom: Dimensions.sizeBoxHeight20,
                            left: Dimensions.sizeBoxWidth20,
                            right: Dimensions.sizeBoxWidth20),
                        child: SmallText(
                          text: "\$ ${game.price!} | Add Title}",
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
