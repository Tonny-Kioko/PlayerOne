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
              size: Dimensions.sizeBoxHeight50 * 3,
            ),
            SizedBox(
              height: Dimensions.sizeBoxHeight30,
            ),
            //Gaming name
            AccountWidget(
                bigText: BigText(
                  text: "Mickey",
                ),
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
            SizedBox(
              height: Dimensions.sizeBoxHeight30,
            ),
            //Mobile Number
            AccountWidget(
                bigText: BigText(
                  text: "+25471515",
                ),
                appIcon: AppIcon(
                  icon: Icons.phone,
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
            SizedBox(
              height: Dimensions.sizeBoxHeight30,
            ),
            //Email
            AccountWidget(
                bigText: BigText(
                  text: "tonny@email.com",
                ),
                appIcon: AppIcon(
                  icon: Icons.email,
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
            SizedBox(
              height: Dimensions.sizeBoxHeight30,
            ),
            //Delivery Address
            AccountWidget(
                bigText: BigText(
                  text: "Nairobi",
                ),
                appIcon: AppIcon(
                  icon: Icons.location_on,
                  backgroundColor: Colors.yellow,
                  iconColor: Colors.white,
                  iconSize: Dimensions.sizeBoxHeight30,
                  size: Dimensions.sizeBoxHeight50,
                )),
            SizedBox(
              height: Dimensions.sizeBoxHeight30,
            ),
            //Important notifications
            AccountWidget(
                bigText: BigText(
                  text: "Check what's happenin...",
                ),
                appIcon: AppIcon(
                  icon: Icons.notifications_active_sharp,
                  backgroundColor: Colors.redAccent,
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
