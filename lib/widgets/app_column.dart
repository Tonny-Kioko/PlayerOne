import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerone/widgets/small_text.dart';

import '../colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final String genre;
  const AppColumn({Key? key, required this.text, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,


      children: [
        BigText(
          text: text,
        ),
        SizedBox(
          height: Dimensions.sizeBoxHeight10,
        ),
        Row(

          children: [

            // SizedBox(width: Dimensions.sizeBoxHeight20,),
            SmallText(text: genre,)
          ],
        ),
        Row(
          children: [

            // Icon(Icons.devices),
            // SizedBox(width: 15,),
            // SmallText(text: "PC, XBOX, PS, AMAZON LUNA")
            SizedBox(
              height: Dimensions.sizeBoxWidth10,
            ),
            IconAndText(

                color: AppColors.mainColor,
                text: "PC, XBOX Series X, PS5, ",
                icon: Icons.devices)
          ],
        )
      ],
    );

  }
}
