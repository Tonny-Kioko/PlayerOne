import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/base/custom_Messages_SnackBar.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/models/login_page_body.dart';
import 'package:playerone/pages/auth/sign_up_page.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_text_fields.dart';
import 'package:playerone/widgets/big_text.dart';

import '../../routes/route_helper.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    void _loginConfirmation() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        customMessagesSnackBar("Please enter your email Address",
            title: "Email Address");
      } else if (!GetUtils.isEmail(email)) {
        customMessagesSnackBar("Enter a Valid email Address",
            title: "email Address");
      } else if (password.isEmpty) {
        customMessagesSnackBar("Please enter your Password", title: "passWord");
      }else if(GetUtils.isAlphabetOnly(password)){
        customMessagesSnackBar("Include numbers and Symbols", title: "passWord");

      } else if(password.length < 8){
        customMessagesSnackBar("Your password is TOO Short", title: "Password");
      }else {
        customMessagesSnackBar("Great, Login successful", title: "Gamer logIn");
        LoginBody(email: email, password: password);
      }
    }

    return Scaffold(
      // backgroundColor: AppColors.backGround,
      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.07,
            ),
            //App Logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/image/signup.jpg"),
                  radius: Dimensions.radius30 * 3 + Dimensions.radius15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: Dimensions.sizeBoxWidth20,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gear up",
                    style: TextStyle(
                      fontSize: Dimensions.font30 + Dimensions.font30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.sizeBoxHeight10,
                  ),
                  Text(
                    "A gaming Extravaganza. ",
                    style: TextStyle(
                        fontSize: Dimensions.font30,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey[500],
                        fontFamily: 'DancingScript'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.sizeBoxHeight20,
            ),
            //Gamer Email
            AppTextField(
                textController: emailController,
                icon: Icons.email,
                hintText: "Email"),

            SizedBox(
              height: Dimensions.sizeBoxHeight20,
            ),

            //Account Password
            AppTextField(
                isObscure: true,
                textController: passwordController,
                icon: Icons.password,
                hintText: "Password"),

            SizedBox(
              height: Dimensions.sizeBoxHeight10,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                    text: TextSpan(
                        text: "Forgot Password?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font26,
                            fontFamily: 'DancingScript'))),
                SizedBox(
                  width: Dimensions.sizeBoxWidth20,
                ),
              ],
            ),
            //Sign Up Button

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                _loginConfirmation();
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(

                    child: BigText(
                      text: 'Sign In',
                      size: Dimensions.font30,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //Sign Up Options
            RichText(
                text: TextSpan(
                    text: "Don't have an Account?...",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font26,
                      fontFamily: 'DancingScript',
                    ),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Get.to(SignUpPage(), transition: Transition.fade),
                      // ..onTap = () {Get.toNamed(RouteHelper.signUpPage());},
                      text: "Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                        fontSize: Dimensions.font30,
                      )),
                ])),
          ],
        ),
      ),
    );
  }
}
