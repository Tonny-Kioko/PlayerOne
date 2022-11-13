import 'package:flutter/cupertino.dart';
import 'package:playerone/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  // final Color iconColor;

  const IconAndText(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,),
        SizedBox(width: 5,),
        SmallText(text: text, color: color,),
      ],
    );
  }
}
