import 'package:flutter/material.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_text_fields.dart';

class SignUpPae extends StatelessWidget {
  const SignUpPae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

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
            height: Dimensions.sizeBoxHeight20,
          ),
        ],
      ),
    );
  }
}
