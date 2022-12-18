import 'package:flutter/material.dart';
import 'package:playerone/widgets/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Your Bucket Hostory",),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
