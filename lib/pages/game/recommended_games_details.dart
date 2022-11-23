import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/routes/route_helper.dart';
import '../../widgets/small_text.dart';

class RecommendedGameDetails extends StatelessWidget {
  final int pageId;
  RecommendedGameDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedGamesController>().recommendedGamesList[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getinitial());
                  },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_basket)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: Container(
                child: Center(
                    child: BigText(size: Dimensions.font26, text: product.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20))),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.white70,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.sizeBoxWidth20,
                right: Dimensions.sizeBoxWidth20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.sizeBoxWidth10,
                        right: Dimensions.sizeBoxWidth10),
                    child: Text(
                      product.description
                  ),
                  )],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.sizeBoxWidth20 * 2,
                right: Dimensions.sizeBoxWidth20 * 2,
                top: Dimensions.sizeBoxHeight10,
                bottom: Dimensions.sizeBoxHeight10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                ),
                
                BigText(text: "\$${product.price!} * 0 "),
                AppIcon(
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.sizeBoxHeight10,
                bottom: Dimensions.sizeBoxHeight10,
                right: Dimensions.sizeBoxWidth10),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizeBoxHeight20,
                      bottom: Dimensions.sizeBoxHeight20,
                      left: Dimensions.sizeBoxWidth20,
                      right: Dimensions.sizeBoxWidth20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(
                    Icons.thumb_up,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizeBoxHeight20,
                      bottom: Dimensions.sizeBoxHeight20,
                      left: Dimensions.sizeBoxWidth20,
                      right: Dimensions.sizeBoxWidth20),
                  child: SmallText(
                    text: "\$69.89 | Total",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
