import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:playerone/base/custom_Messages_SnackBar.dart';
import 'package:playerone/base/custom_loader.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/auth_controller.dart';
import 'package:playerone/models/sign_up_model_body.dart';
import 'package:playerone/routes/route_helper.dart';
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
      "facebook.png",
      "github.png",
      "gmail.png",
      "twitter.png",
    ];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();
      String phone = phoneController.text.trim();

      if (name.isEmpty) {
        customMessagesSnackBar("Please enter a gamer name",
            title: "Gamer name");
      } else if (phone.isEmpty) {
        customMessagesSnackBar("Please enter your Phone number ",
            title: "Mobile number");
      } else if (!GetUtils.isPhoneNumber(phone)) {
        customMessagesSnackBar("Enter a Valid phone Number",
            title: "Mobile number");
      } else if (email.isEmpty) {
        customMessagesSnackBar("Please enter your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        customMessagesSnackBar("Please enter a valid email address",
            title: "Email address");
      } else if (password.isEmpty) {
        customMessagesSnackBar("Please enter your password", title: "Password");
      } else if (password.length < 8) {
        customMessagesSnackBar("Password cannot be less than 8 characters",
            title: "Password");
      } else if (GetUtils.isAlphabetOnly(password)) {
        customMessagesSnackBar("Include Numbers and Symbols",
            title: "Password");
      } else if (password != confirmPassword) {
        customMessagesSnackBar("Ensure a match with Password",
            title: "Confirm password");
      } else {
        customMessagesSnackBar("Account creation in Progress",
            title: "Creating account...");
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password,
            confirmPassword: confirmPassword);

        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            customMessagesSnackBar("Your account has been created");
            Get.offNamed(RouteHelper.getinitial());
          } else {
            customMessagesSnackBar(
              status.message,
            );
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return _authController.isLoading
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.07,
                    ),
                    Container(
                      height: Dimensions.screenHeight * 0.1,
                      child: Center(
                          child: Text(
                        "New Here? Welcome 🎮",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font30+4,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DancingScript'),

                      )),
                    ),
                    //Gamer Name
                    AppTextField(
                      textController: nameController,
                      icon: Icons.person,
                      hintText: "Gamer Name",
                    ),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight20,
                    ),
                    //Gamer Email
                    AppTextField(
                      textController: emailController,
                      icon: Icons.email,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight20,
                    ),
                    //Gamer Name

                    SizedBox(
                      height: Dimensions.sizeBoxHeight10,
                    ),
                    //Mobile Number
                    AppTextField(
                      textController: phoneController,
                      icon: Icons.phone,
                      hintText: "Phone Number",
                    ),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight20,
                    ),
                    //Account Password
                    AppTextField(
                      isObscure: true,
                      textController: passwordController,
                      icon: Icons.password,
                      hintText: "Password",
                    ),

                    SizedBox(
                      height: Dimensions.sizeBoxHeight20,
                    ),
                    //Confirm Password
                    AppTextField(
                      isObscure: true,
                      textController: confirmPasswordController,
                      icon: Icons.password,
                      hintText: "Confirm Password",
                    ),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight20 * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
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
                    ),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight10,
                    ),
                    //Sign Up Button
                    RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "Already have an Account?",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font26,
                              fontFamily: 'DancingScript',
                            ))),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight30 / 2,
                    ),
                    //Sign Up Options
                    RichText(
                        text: TextSpan(
                            text: "--Or sign Up using--",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font26,
                              fontFamily: 'DancingScript',
                            ))),
                    SizedBox(
                      height: Dimensions.sizeBoxHeight30 / 2,
                    ),
                    Wrap(
                      children: List.generate(
                          4,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: Dimensions.radius20,
                                  backgroundImage: AssetImage(
                                      "assets/image/" + signUpImages[index]),
                                ),
                              )),
                    )
                  ],
                ),
              )
            :const CustomLoader();
      }),
    );
  }
}
