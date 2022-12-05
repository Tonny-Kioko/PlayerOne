import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/popular_games-controller.dart';
import 'package:playerone/data/controllers/recommended_games_controller.dart';
import 'package:playerone/data/repository/popular_games_repository.dart';
import 'package:playerone/models/games_model.dart';
import 'package:playerone/pages/game/popular_game_details.dart';
import 'package:playerone/routes/route_helper.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/big_text.dart';
import 'package:playerone/widgets/icon_and_text.dart';
import 'package:playerone/widgets/small_text.dart';

import '../../widgets/app_column.dart';

class GamePageBody extends StatefulWidget {
  const GamePageBody({Key? key}) : super(key: key);

  @override
  _GamePageBodyState createState() => _GamePageBodyState();
}

class _GamePageBodyState extends State<GamePageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

    get index => Get.find<PopularGamesController>().popularGamesList[pageId];

  get pageId => null;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularGamesController>(builder: (popularGames) {
          return popularGames.isLoaded
              ? Container(
                  // color: Color(0xff3f4156),
                  height: Dimensions.pageView,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getPopularGame(index));
                    },
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularGames.popularGamesList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularGames.popularGamesList[position]);
                        }),
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularGamesController>(builder: (popularGames) {
          return DotsIndicator(
            dotsCount: popularGames.popularGamesList.isEmpty
                ? 1
                : popularGames.popularGamesList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.mainColor,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // Adding a popular Games Section
        SizedBox(
          height: Dimensions.sizeBoxHeight10,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.sizeBoxWidth30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.sizeBoxWidth5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: BigText(
                  text: " . * . ",
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: Dimensions.sizeBoxWidth5,
              ),
              Container(
                child: SmallText(
                  text: "Across All Genres",
                ),
              )
            ],
          ),
        ),
        //List of popular games to scroll through

        GetBuilder<RecommendedGamesController>(builder: (recommendedGame) {
          return recommendedGame.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedGame.recommendedGamesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.sizeBoxWidth20,
                          right: Dimensions.sizeBoxWidth20,
                          bottom: Dimensions.sizeBoxHeight10),
                      child: Row(
                        children: [
                          //Images on the Row container
                          Container(
                            width: Dimensions.listViewImage,
                            height: Dimensions.listViewImage,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedGame
                                            .recommendedGamesList[index]
                                            .image!))),
                          ),
                          //Texts Section with Image/Game details
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.getrecommendedGame(index));
                              },
                              child: Container(
                                height: Dimensions.listViewText,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.sizeBoxWidth10,
                                      right: Dimensions.sizeBoxWidth10),
                                  child: AppColumn(
                                    text: recommendedGame
                                        .recommendedGamesList[index].name!,
                                    genre: recommendedGame
                                        .recommendedGamesList[index].genre!,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, GameModel popularGame) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 5, right: 5),
            // padding: EdgeInsets.only(top: 50, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: index.isEven ? Color(0xff6f42c1) : Color(0xff6610f2),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularGame.image!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff3f4156),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(
                  text: popularGame.name!, genre: popularGame.genre!,
                  // text: "ASSASIN'S CREED VALHALLA",
                  // genre: ' Action, Role-Playing',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
