import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/base/custom_loader.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/auth_controller.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/data/controllers/user_controller.dart';
import 'package:playerone/routes/route_helper.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';

import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      //print("User log in is working well");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        title: BigText(
          text: "Gamer Profile",
          size: Dimensions.font26,
          color: Colors.grey[500],
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLoggedIn
            ? (userController.isLoading
                ? Container(
                    color: AppColors.backGround,
                    width: double.maxFinite,
                    // margin: EdgeInsets.only(top: Dimensions.sizeBoxHeight10, ),
                    child: Column(
                      children: [
                        //Gamers' Account Icon
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.sizeBoxHeight50 +
                              Dimensions.sizeBoxHeight20,
                          size: Dimensions.sizeBoxHeight50 * 3,
                        ),
                        SizedBox(
                          height: Dimensions.sizeBoxHeight20,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              //Gaming name
                              AccountWidget(
                                  bigText: BigText(
                                    text: userController.userModel.name,
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
                                  bigText: BigText(
                                    text: userController.userModel.phone,
                                    size: Dimensions.font26,
                                    color: Colors.grey[500],
                                  ),
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
                                    text: userController.userModel.email,
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
                              SizedBox(
                                height: Dimensions.sizeBoxHeight20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>()
                                      .userLoggedIn()) {
                                    Get.find<AuthController>()
                                        .clearSharedData();
                                    Get.find<CartController>().clear();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.offNamed(RouteHelper.getSignInPage());
                                  }
                                },
                                child: AccountWidget(
                                    bigText: BigText(
                                      text: "Logout",
                                      size: Dimensions.font26,
                                      color: Colors.grey[500],
                                    ),
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.sizeBoxHeight45,
                                      size: Dimensions.sizeBoxHeight50,
                                    )),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  )
                : CustomLoader())
            : Container(
          color: AppColors.backGround,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        width: double.maxFinite,
                        height: Dimensions.sizeBoxHeight50*11,
                        // margin: EdgeInsets.only(
                        //     left: Dimensions.sizeBoxWidth20,
                        //     right: Dimensions.sizeBoxWidth20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/codmw.jpg"))),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignInPage());
                        },

                        child: Container(
                          width: double.maxFinite,
                          height: Dimensions.sizeBoxHeight20*4,
                          margin: EdgeInsets.only(
                              left: Dimensions.sizeBoxWidth5,
                              right: Dimensions.sizeBoxWidth5),
                          decoration: BoxDecoration(
                            color: AppColors.backGround,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                          ),
                          child: Center(
                              child: BigText(
                            text: "SignIn",
                            color: Colors.white,
                            size: Dimensions.font30,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
