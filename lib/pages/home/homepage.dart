import 'package:flutter/material.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/pages/home/main_game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainGamePage(),
    Container(child: Center(child: Text("Next page"),),),
    Container(child: Center(child: Text("Next page2"),),),
    Container(child: Center(child: Text("Next page3"),),),
    Container(child: Center(child: Text("Next page4"),),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedIconTheme: ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "Home",

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: "Home"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: "Home"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: "Home"

          ),
        ],
      ),
    );
  }
}
