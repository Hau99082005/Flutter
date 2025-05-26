import 'package:flutter/material.dart';
import 'package:window_app/models/category.dart';
import 'package:window_app/views/screens/detail/screens/widgets/inner_category_content_widget.dart';
import '../../nav_screens/Cart_screen.dart';
import '../../nav_screens/Stores_screen.dart';
import '../../nav_screens/account_screen.dart';
import '../../nav_screens/category_screen.dart';
import '../../nav_screens/favorite_screen.dart';

class InnerCategoryScreen extends StatefulWidget {
  final Category category;

  const InnerCategoryScreen({super.key, required this.category});

  @override
  State<InnerCategoryScreen> createState() => _InnerCategoryScreenState();
}

class _InnerCategoryScreenState extends State<InnerCategoryScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      InnerCategoryContentWidget(category: widget.category,),
      const FavoriteScreen(),
      const CategoryScreen(),
      const StoresScreen(),
      const CartScreen(),
       AccountScreen(),
    ];

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,

        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            setState(() {
              pageIndex = value;
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
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
      body: pages[pageIndex],
    );
  }
}

