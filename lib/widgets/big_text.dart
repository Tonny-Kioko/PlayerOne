import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      this.size = 20,
      required this.text,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: overflow,
    style: TextStyle(
      color: color,
        fontFamily: 'DancingScript',
      fontSize: size,
      fontWeight: FontWeight.w400
    ),);
  }
}