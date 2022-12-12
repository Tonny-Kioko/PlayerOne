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
  void onTapNavigation(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor : Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
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
              label: "Favorite"

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
  }
}
