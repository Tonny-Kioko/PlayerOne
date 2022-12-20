import 'package:flutter/material.dart';

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

      children: [
        Image.asset(imagePath,
        height: MediaQuery.of(context).size.height*0.22,
        width: MediaQuery.of(context).size.width*0.22,
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Text(text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height*0.0175,
          color: Theme.of(context).disabledColor,
        ),)
      ],
    );
  }
}
