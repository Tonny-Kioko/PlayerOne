import 'package:flutter/material.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';

import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3f4156),
        title: BigText(
          text: "Gamer Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(

        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.sizeBoxHeight10),
        child: Column(
          children: [
            //Gamers' Account Icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.sizeBoxHeight50 + Dimensions.sizeBoxHeight20,
              size: Dimensions.sizeBoxHeight50*3,
            ),
            SizedBox(height: Dimensions.sizeBoxHeight30,),
            //Gaming name
            AccountWidget(bigText: BigText(text: "pal",),
                appIcon: AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
            )),
            SizedBox(height: Dimensions.sizeBoxHeight30,),
            //Mobile Number
            AccountWidget(bigText: BigText(text: "pal",),
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
            SizedBox(height: Dimensions.sizeBoxHeight30,),
            //Email
            AccountWidget(bigText: BigText(text: "pal",),
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
            //Delivery Address
            SizedBox(height: Dimensions.sizeBoxHeight30,),
            //Important notifications
            AccountWidget(bigText: BigText(text: "pal",),
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
          ],
        ),
      ),
    );
  }
}
