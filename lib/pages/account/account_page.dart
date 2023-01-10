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
        backgroundColor: AppColors.backGround,
        title: BigText(
          text: "Gamer Profile",
          size: 24,
          color: Colors.grey[500],
        ),
      ),

      body: Container(
        color: AppColors.backGround,
        width: double.maxFinite,
        // margin: EdgeInsets.only(top: Dimensions.sizeBoxHeight10),
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  //Gaming name
                  AccountWidget(
                      bigText: BigText(
                        text: "Mickey",
                        size: Dimensions.font26,
                        color: Colors.grey[500],
                      ),
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.sizeBoxHeight45,
                        size: Dimensions.sizeBoxHeight50,
                      )),
                  SizedBox(
                    height: Dimensions.sizeBoxHeight20,
                  ),
                  //Mobile Number
                  AccountWidget(
                      bigText:
                          BigText(text: "+254715150317", size: Dimensions.font26, color: Colors.grey[500],),
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: Colors.blueAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.sizeBoxHeight45,
                        size: Dimensions.sizeBoxHeight50,
                      )),
                  SizedBox(
                    height: Dimensions.sizeBoxHeight20,
                  ),
                  //Email
                  AccountWidget(
                      bigText: BigText(
                        text: "tonny@email.com",
                        size: Dimensions.font26,
                        color: Colors.grey[500],
                      ),
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: Colors.blueAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.sizeBoxHeight45,
                        size: Dimensions.sizeBoxHeight50,
                      )),
                  SizedBox(
                    height: Dimensions.sizeBoxHeight20,
                  ),
                  //Delivery Address
                  AccountWidget(
                      bigText: BigText(
                        text: "Nairobi",
                        size: Dimensions.font26,
                        color: Colors.grey[500],
                      ),
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: Colors.blueAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.sizeBoxHeight45,
                        size: Dimensions.sizeBoxHeight50,
                      )),
                  SizedBox(
                    height: Dimensions.sizeBoxHeight20,
                  ),
                  //Important notifications
                  AccountWidget(
                      bigText: BigText(
                        text: "Check what's happenin...",
                        size: Dimensions.font26,
                        color: Colors.grey[500],
                      ),
                      appIcon: AppIcon(
                        icon: Icons.notifications_active_sharp,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.sizeBoxHeight45,
                        size: Dimensions.sizeBoxHeight50,
                      )),
                  SizedBox(
                    height: Dimensions.sizeBoxHeight20,
                  ),
                  //Payment Information
                  AccountWidget(
                      bigText: BigText(
                        text: "Payment Details",
                        size: Dimensions.font26,
                        color: Colors.grey[500],
                      ),
                      appIcon: AppIcon(
                        icon: Icons.payments,
                        backgroundColor: Colors.green,
                        iconColor: Colors.white,
                        iconSize: Dimensions.sizeBoxHeight45,
                        size: Dimensions.sizeBoxHeight50,
                      )),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
