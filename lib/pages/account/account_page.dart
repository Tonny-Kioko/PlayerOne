import 'package:flutter/material.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3f4156),
        title: BigText(
          text: "Gamer Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          AppIcon(icon: Icons.person,)
        ],
      ),
    );
  }
}
