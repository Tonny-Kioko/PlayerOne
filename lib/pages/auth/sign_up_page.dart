import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_text_fields.dart';
import 'package:playerone/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "assets/image/facebook.png",
      "assets/image/github.png",
      "assets/image/gmail.png",
      "assets/image/twitter.png",
    ];

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
          //Gamer Email
          AppTextField(
              textController: emailController,
              icon: Icons.email,
              hintText: "Email"),
          SizedBox(
            height: Dimensions.sizeBoxHeight20,
          ),
          //Gamer Name
          AppTextField(
              textController: nameController,
              icon: Icons.person,
              hintText: "Gamer Name"),
          SizedBox(
            height: Dimensions.sizeBoxHeight20,
          ),
          //Mobile Number
          AppTextField(
              textController: phoneController,
              icon: Icons.phone,
              hintText: "Phone Number"),
          SizedBox(
            height: Dimensions.sizeBoxHeight20,
          ),
          //Account Password
          AppTextField(
              textController: passwordController,
              icon: Icons.password,
              hintText: "Password"),
          SizedBox(
            height: Dimensions.sizeBoxHeight20,
          ),
          //Confirm Password
          AppTextField(
              textController: confirmPasswordController,
              icon: Icons.password,
              hintText: "Confirm Password"),
          SizedBox(
            height: Dimensions.sizeBoxHeight20 * 2,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: AppColors.mainColor,
            ),
            child: Center(
              child: BigText(
                text: 'Sign Up',
                size: Dimensions.font30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.sizeBoxHeight10,
          ),
          //Sign Up Button
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Alreay have an Account?",
                  style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20,
                  ))),
          SizedBox(
            height: Dimensions.screenHeight*0.05,
          ),
          //Sign Up Options
          RichText(
              text: TextSpan(

                  text: "Sign Up Using...",
                  style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20,
                  ))),
          Wrap(
            children: List.generate(3, (index) =>CircleAvatar(

            )),
          )
        ],
      ),
    );
  }
}
