import 'package:flutter/material.dart';
import 'package:playerone/utils/dimensions.dart';

class CleanDataPage extends StatelessWidget {
  final String text;
  final String imagePath;
  const CleanDataPage(
      {Key? key,
      required this.text,
      this.imagePath = 'assets/image/history_basket.jpg'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imagePath,

        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height*0.73
        //width: MediaQuery.of(context).size.width*0.22,
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Text(text,
        style: TextStyle(
          fontFamily: 'DancingScript',
          fontSize: MediaQuery.of(context).size.height*0.0175,
          color: Colors.grey[500],
        ),
        textAlign: TextAlign.center,),

      ],
    );
  }
}
