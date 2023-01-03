import 'package:flutter/material.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_text_fields.dart';

class SignUpPae extends StatelessWidget {
  const SignUpPae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.09,
          ),
          Container(
            height: Dimensions.screenHeight * 0.25,
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/image/signup.jpg"),
              ),
            ),
          ),
          AppTextField(textController: emailController, icon: Icons.email, hintText: "Email")

        ],
      ),
    );
  }
}
