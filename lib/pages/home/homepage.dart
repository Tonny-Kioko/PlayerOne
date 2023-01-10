import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/pages/account/account_page.dart';
import 'package:playerone/pages/auth/sign_up_page.dart';
import 'package:playerone/pages/home/main_game_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:playerone/utils/dimensions.dart';

import '../cart/cart_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    MainGamePage(),
    SignUpPage(),
    CartHistory(),
    AccountPage(),

  ];
  void onTapNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MainGamePage(),
      SignUpPage(),
      CartHistory(),
      AccountPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.deepPurpleAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Favorites"),
        activeColorPrimary: Colors.deepPurpleAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket),
        title: ("Basket"),
        activeColorPrimary: Colors.deepPurpleAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle_sharp),
        title: ("Gamer"),
        activeColorPrimary: Colors.deepPurpleAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor : Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        // showSelectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNavigation,
        // backgroundColor : Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Home",

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,),
              label: "Favorites"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined,),
              label: "Basket"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp,),
              label: "User"

          ),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: AppColors.backGround,
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      //backgroundColor: Colors.grey, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15/15),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.neumorphic,
          //style1, neumorphic or style12 or 13 for consideration* Choose the nav bar style with this property.
    );
  }
}
