import 'package:flutter/cupertino.dart';
import 'package:playerone/utils/dimensions.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: Dimensions.sizeBoxWidth10,
            top: Dimensions.sizeBoxWidth10,
            bottom: Dimensions.sizeBoxWidth10));
  }
}
