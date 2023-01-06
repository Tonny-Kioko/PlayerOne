import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playerone/data/controllers/auth_controller.dart';
import 'package:playerone/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("I'm loading just fine"+Get.find<AuthController>().isLoading.toString());
    return Container(
      height: Dimensions.sizeBoxHeight50*2,
      width: Dimensions.sizeBoxHeight50*2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.sizeBoxHeight50),

      ),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
