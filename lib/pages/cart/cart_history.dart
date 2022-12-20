import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:playerone/base/clean_data_page.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/cart_controller.dart';
import 'package:playerone/models/cart_model.dart';
import 'package:playerone/routes/route_helper.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    // Determines the number of items in the cart at every distinct order time
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;
    Widget timeWidget (int index){
      var outputDate = DateTime.now().toString();
      if(index< getCartHistoryList.length) {
        DateTime parseDate = DateFormat(
            "yyyy-MM-dd HH:mm:ss")
            .parse(
            getCartHistoryList[listCounter]
                .time!);
        var inputDate = DateTime.parse(
            parseDate.toString());
        var outputFormat =
        DateFormat("dd/MM/yyyy hh:mm");
        var outputDate =
        outputFormat.format(inputDate);
        return BigText(
          text: outputDate,
        );
      }

      return BigText(text: outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.sizeBoxHeight20 * 5,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.sizeBoxHeight20),
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
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().length > 0
                ? Expanded(
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
                                  height: Dimensions.sizeBoxHeight20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.sizeBoxHeight20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      timeWidget(listCounter),
                                      SizedBox(
                                        height: Dimensions.sizeBoxHeight10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                                itemsPerOrder[i], (index) {
                                              if (listCounter <
                                                  getCartHistoryList.length) {
                                                listCounter++;
                                              }
                                              return index <= 2
                                                  ? Container(
                                                      height: Dimensions
                                                              .sizeBoxHeight20 *
                                                          5,
                                                      width: Dimensions
                                                              .sizeBoxWidth10 *
                                                          10,
                                                      margin: EdgeInsets.only(
                                                          right: Dimensions
                                                              .sizeBoxWidth5),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(Dimensions
                                                                      .radius15 /
                                                                  2),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(AppConstants
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
                                            height: Dimensions.sizeBoxHeight45 +
                                                Dimensions.sizeBoxHeight30,
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
                                                  text: itemsPerOrder[i]
                                                          .toString() +
                                                      "Items",
                                                  color: Colors.black54,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    var orderTime =
                                                        cartOrderTimeToList();
                                                    Map<int, CartModel>
                                                        moreOrder = {};
                                                    for (int j = 0;
                                                        j <
                                                            getCartHistoryList
                                                                .length;
                                                        j++) {
                                                      if (getCartHistoryList[j]
                                                              .time ==
                                                          orderTime[i]) {
                                                        //print("The proper ID is"+getCartHistoryList[j].id.toString());
                                                        moreOrder.putIfAbsent(
                                                            getCartHistoryList[j]
                                                                .id!,
                                                            () => CartModel.fromJson(
                                                                jsonDecode(jsonEncode(
                                                                    getCartHistoryList[
                                                                        j]))));
                                                      }
                                                    }
                                                    Get.find<CartController>()
                                                        .setItems = moreOrder;
                                                    Get.find<CartController>()
                                                        .addToCartList();
                                                    Get.toNamed(RouteHelper
                                                        .getCartPage());
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: Dimensions
                                                            .sizeBoxWidth10,
                                                        vertical: Dimensions
                                                                .sizeBoxHeight10 /
                                                            2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                                  .radius15 /
                                                              3),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: AppColors
                                                              .mainColor),
                                                    ),
                                                    child: SmallText(
                                                        text: 'Re-Order',
                                                        color: AppColors
                                                            .mainColor),
                                                  ),
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
                : Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  child: Center(
                    child: CleanDataPage(
                        text: "Your history i'snt Available",
                        imagePath: 'assets/image/empty_box.jpg',
                      ),
                  ),
                );
          })
        ],
      ),
    );
  }
}
