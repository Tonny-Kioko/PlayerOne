import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.sizeBoxWidth5*3,
              right: Dimensions.sizeBoxWidth20,
              top: Dimensions.sizeBoxHeight50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios_new_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.iconSize15*3),
                  SizedBox(width: Dimensions.sizeBoxWidth20*5,),
                  AppIcon(icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.iconSize15*3),
                  AppIcon(icon: Icons.shopping_basket_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.iconSize15*3)
                ],

          )),
          Positioned(
              top: Dimensions.sizeBoxHeight20*5,
              left: Dimensions.sizeBoxWidth20,
              right: Dimensions.sizeBoxWidth20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.sizeBoxHeight10),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index){
                          return Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.sizeBoxHeight20*5,
                                  height: Dimensions.sizeBoxHeight20*5,
                                  margin: EdgeInsets.only(bottom: Dimensions.sizeBoxHeight10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].image!
                                        ),
                                    ),
                                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: Dimensions.sizeBoxWidth10,),
                                Expanded(child: Container(
                                  height: Dimensions.sizeBoxHeight20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                                      SmallText(text:cartController.getItems[index].genre!, size: Dimensions.font20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(text: cartController.getItems[index]!.price.toString(), color: Colors.black54,),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.sizeBoxHeight10,
                                                bottom: Dimensions.sizeBoxHeight10,
                                                left: Dimensions.sizeBoxWidth10,
                                                right: Dimensions.sizeBoxWidth10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularGames.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.sizeBoxHeight10 / 2,
                                                ),
                                                SmallText(text: " 0"),//popularGames.inCartItems.toString()),
                                                SizedBox(
                                                  width: Dimensions.sizeBoxHeight10 / 2,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularGames.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
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
                  },),
                ),
          ))
        ],
      ),
    );
  }
}
