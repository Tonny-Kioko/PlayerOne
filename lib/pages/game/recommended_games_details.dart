import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_icon.dart';
import 'package:playerone/widgets/big_text.dart';

import '../../widgets/small_text.dart';

class RecommendedGameDetails extends StatelessWidget {
  const RecommendedGameDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_basket)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: Container(
                child: Center(
                    child: BigText(size: Dimensions.font26, text: "FIFA22")),
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
              background: Image.asset(
                "assets/image/fifa2022.jpeg",
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
                        "FIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google Stadia FIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the FIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S FIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google StadiaFIFA 22 is an association football simulation video game published by Electronic Arts as part of the FIFA series. It is be the 29th installment in the FIFA series, and was released 1 October 2021 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One consoles. Enhanced versions for the PlayStation 5, Xbox Series X/S and Google Stadiaand Google StadiaPlayStation 5, Xbox Series X/S and Google Stadia were released later. A beta version was released in August 13, 2021 in the United States, Canada and South Korea, August 14 in Brazil and Portugal, August 15 in Turkey and August 16 in the rest of the world, for the PS4, PS5 and Windows. The Nintendo Switch version is releasing on August 19 in the US and Canada and on August 20 in the West."),
                  ),
                ],
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
                
                BigText(text: "\$69.89 " + " * " + " 0 "),
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
