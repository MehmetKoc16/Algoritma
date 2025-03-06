import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          color: Colors.grey,
          activeColor: Colors.black,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 21,
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              icon: Icons.home,
              text: "shop",
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: "Cart",
            )
          ]),
    );
  }
}
