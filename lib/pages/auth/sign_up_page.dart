import 'package:flutter/material.dart';
import 'package:playerone/utils/dimensions.dart';

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
          Container(
              margin: EdgeInsets.only(
                  left: Dimensions.sizeBoxHeight20,
                  right: Dimensions.sizeBoxHeight20),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 10),
                    color: Colors.grey.withOpacity(0.3))
              ]),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    //Hint Text
                    hintText: "Email",
                    // Prefix Icon
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    // Focused Border
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15 * 2),
                        borderSide:
                            BorderSide(width: 1.0, color: Colors.white)),
                    // Enabled Border
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15 * 2),
                        borderSide: BorderSide(
                            width: 1.0, color: Colors.white)), // Border
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15 * 2),
                        borderSide:
                            BorderSide(width: 1.0, color: Colors.white)),
                  )))
        ],
      ),
    );
  }
}
