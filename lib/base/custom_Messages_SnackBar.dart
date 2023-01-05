import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/small_text.dart';

void customMessagesSnackBar(String message,
    {bool isError = true, String title = "An error Occurred"}) {
  Get.snackbar(
    title,
    message,
    titleText: SmallText(
      text: title,
      color: Colors.white,
      size: Dimensions.font20,
    ),
    messageText: SmallText(
      text: message,
      color: Colors.white,
      size: Dimensions.font20,
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.redAccent,

  );
}
