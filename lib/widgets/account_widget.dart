import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';

import '../colors.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key, required this.bigText, required this.appIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backGround,
      padding: EdgeInsets.only(
          left: Dimensions.sizeBoxWidth10,
          top: Dimensions.sizeBoxWidth10,
          bottom: Dimensions.sizeBoxWidth10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.sizeBoxWidth10 * 3,
          ),
          bigText,
        ],
      ),
      // decoration: BoxDecoration( boxShadow: [
      //   BoxShadow(
      //     blurRadius: 2,
      //     offset: Offset(0, 2),
      //     color: Colors.grey.withOpacity(0.3),
      //   )
      // ]),
    );
  }
}
