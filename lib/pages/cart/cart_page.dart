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
              left: Dimensions.sizeBoxWidth30,
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

          ))
        ],
      ),
    );
  }
}
