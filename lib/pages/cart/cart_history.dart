import 'package:flutter/material.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/widgets/big_text.dart';

import '../../utils/dimensions.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Your Basket History",
                  color: Colors.black54,
                ),
                Icon(Icons.shopping_basket,
                    size: Dimensions.iconSize24 * 2, color: Colors.white)
              ],
            ),
          )
        ],
      ),
    );
  }
}
