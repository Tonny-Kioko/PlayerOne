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
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularGameDetail extends StatelessWidget {
  final int pageId;
  const PopularGameDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var game = Get.find<PopularGamesController>().popularGamesList[pageId];
    Get.find<PopularGamesController>().initData( game, Get.find<CartController>());
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
                        image: AssetImage("assets/image/farcry6.jpeg"))),
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
                      onTap: (){
                        Get.to(() => MainGamePage());
                  },
                      child:
                  AppIcon(icon: Icons.arrow_back_ios_new_outlined)),
                  AppIcon(icon: Icons.shopping_basket_outlined)
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
                        text: "FARCRY 6",
                        genre: 'Action, Adventure, First Person Shooter',
                      ),
                      SizedBox(
                        height: Dimensions.sizeBoxHeight20,
                      ),
                      BigText(text: "About"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                              text:
                                  "Welcome to Yara, a tropical paradise frozen in time. As the dictator of Yara, Antón Castillo is intent on restoring his nation back to its former glory by any means, with his son, Diego, following in his bloody footsteps. Their ruthless oppression has ignited a revolution. The player-character, Dani Rojas is both fully voiced and has a fleshed-out personality unlike the Deputy or Captain, and is also unable to be customized like either of them save for the choice of their gender wherein their name remains the same. Weapons each have their own category and two sub-categories, Regular and Unique, the latter of which boast some increased stats compared to the regular variant, but cannot be customized unlike the regular variant, though unlocking them provides their unique appearance to use on the regular variant. Two new categories of weapons introduced in 6 are the Resolver Weapons, which each have a unique appearance and capability to suit a different style of guerilla warfare, and the Supremos, personnel-based war machines designed to cause mayhem in a wide area or boost their wearer in a unique way.In this installment of the franchise, the companion system from Far Cry 5 returns and is now called 'Amigos', but eschews the use of any human companions. Every Amigo is what was previously called a Fang for Hire, including but not limited to: Guapo, a Hawaiian-shirt-wearing crocodile that can bring himself back to life, Chorizo, a wheelchair-bound Dachshund that can distract enemies with sheer adorableness, Chicharrón, an ex-cockfighting rooster with a thirst for the blood of military soldiers, Boomer, a man's best friend from Hope County, Montana, K-9000, a robotic pitbull from an 80's Sci-Fi future, Champagne, a wealthy rich white cougar, and Oluso, a legendary jaguar blessed by Oluwas.In addition to the main quest to take down the standing dictatorial ruler of Yara, Antón Castillo, Dani will encounter numerous characters each with their own side quest to help them get back some semblance of normal living while screwing over the occupation as much as possible in side quests called Yaran Stories. There are also a multitude of Treasure Hunts, in similar style to the Prepper Stashes of 5, that provide Dani with resources in the fight against tyranny.",),
                        ),
                      )
                    ],
                  )))
          //An expandable widget with about section
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularGamesController>(builder: (popularGames){
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
                      onTap: (){
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
                    SmallText(text: popularGames.quantity.toString()),
                    SizedBox(
                      width: Dimensions.sizeBoxHeight10 / 2,
                    ),
                    GestureDetector(
                      onTap: (){
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
                  onTap: (){
                    popularGames.addItem(product);
                  },
                  child: SmallText(
                    text: "\$69.00 | Add to Basket",
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
      },),
    );
  }
}
