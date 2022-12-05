import 'package:flutter/material.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';

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
                color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: 15,
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
                                image: AssetImage(
                                  "assets/image/forza5.jpg"
                                )
                              ),
                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
          ))
        ],
      ),
    );
  }
}
