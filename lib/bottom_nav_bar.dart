import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_ci/Product/ui/screens/product_list_screen.dart';
import 'package:quick_ci/ShoppingCart/ui/screens/shopping_cart_screen.dart';
import 'package:quick_ci/User/ui/screens/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              activeColor: Color(0xFF3F51B5),
              backgroundColor: Colors.white10,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.article)),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
                BottomNavigationBarItem(icon: Icon(Icons.person)),
              ]),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => ProductListScreen(),
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => ShoppingCartScreen(),
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => ProfileScreen(),
                );
                break;
            }
          }),
    );
  }
}
