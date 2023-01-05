import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;

  final IconData icon;
  const AppTextField(
      {Key? key,
      required this.textController,
      required this.icon,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: Dimensions.sizeBoxHeight20,
            right: Dimensions.sizeBoxHeight20),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1, 10),
              color: Colors.grey.withOpacity(0.3))
        ]),
        child: TextField(
            controller: textController,
            decoration: InputDecoration(
              //Hint Text
              hintText: hintText,
              // Prefix Icon
              prefixIcon: Icon(
                icon,
                color: Colors.blue,
              ),
              // Focused Border
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
                  borderSide: BorderSide(width: 1.0, color: Colors.white)),
              // Enabled Border
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
                  borderSide:
                      BorderSide(width: 1.0, color: Colors.white)), // Border
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
                  borderSide: BorderSide(width: 1.0, color: Colors.white)),
            )));
  }
}
