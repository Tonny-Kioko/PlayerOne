import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();
    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Your Basket History",
                  color: Colors.black54,
                ),
                Icon(Icons.shopping_basket,
                    size: Dimensions.iconSize24 * 2, color: Colors.white)
              ],
            ),
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.sizeBoxHeight20,
                    left: Dimensions.sizeBoxWidth20,
                    right: Dimensions.sizeBoxWidth20,
                  ),
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView(
                      children: [
                        for (int i = 0; i < itemsPerOrder.length; i++)
                          Container(
                            height: 115,
                            margin: EdgeInsets.only(
                                bottom: Dimensions.sizeBoxHeight20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (() {
                                  DateTime parseDate =
                                      DateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                          getCartHistoryList[listCounter]
                                              .time!);
                                  var inputDate =
                                      DateTime.parse(parseDate.toString());
                                  var outputFormat =
                                      DateFormat("dd/MM/yyyy hh:mm");
                                  var outputDate =
                                      outputFormat.format(inputDate);
                                  return BigText(text: outputDate,);
                                }()),
                                SizedBox(
                                  height: Dimensions.sizeBoxHeight10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(itemsPerOrder[i],
                                          (index) {
                                        if (listCounter <
                                            getCartHistoryList.length) {
                                          listCounter++;
                                        }
                                        return index <= 2
                                            ? Container(
                                                height: 100,
                                                width: 100,
                                                margin: EdgeInsets.only(
                                                    right: Dimensions
                                                        .sizeBoxWidth5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                    .radius15 /
                                                                2),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            AppConstants
                                                                    .BASE_URL +
                                                                AppConstants
                                                                    .UPLOAD_URL +
                                                                getCartHistoryList[
                                                                        listCounter -
                                                                            1]
                                                                    .image!))),
                                              )
                                            : Container();
                                      }),
                                    ),
                                    Container(
                                      height: 75,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SmallText(
                                            text: "Total",
                                            color: Colors.black54,
                                          ),
                                          BigText(
                                            text: itemsPerOrder[i].toString() +
                                                "Items",
                                            color: Colors.black54,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Dimensions.sizeBoxWidth10,
                                                vertical:
                                                    Dimensions.sizeBoxHeight10 /
                                                        2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 3),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.mainColor),
                                            ),
                                            child: SmallText(
                                                text: 'Show More',
                                                color: AppColors.mainColor),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
