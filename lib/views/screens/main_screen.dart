import 'package:flutter/material.dart';
import 'package:window_app/views/screens/nav_screens/Cart_screen.dart';
import 'package:window_app/views/screens/nav_screens/Stores_screen.dart';
import 'package:window_app/views/screens/nav_screens/account_screen.dart';
import 'package:window_app/views/screens/nav_screens/favorite_screen.dart';
import 'package:window_app/views/screens/nav_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
     HomeScreen(),
    FavoriteScreen(),
    StoresScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,

        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            setState(() {
              _pageIndex = value;
            });
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/home.png",
              width: 25,
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/love.png",
              width: 25,
              color: Colors.black,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/mart.png",
              width: 25,
              color: Colors.black,
            ),
            label: "Stores",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/cart.png",
              width: 25,
              color: Colors.black,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/user.png",
              width: 25,
              color: Colors.black,
            ),
            label: "Account",
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
