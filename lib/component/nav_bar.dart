import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../helpers/theme.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavBar({
    super.key,
    required this.selectedIndex, required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    // final isSelected = index == selectedIndex;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      margin: EdgeInsets.only(bottom: bottomPadding),
      decoration: const BoxDecoration(
        color: AppColors.darkerWhite,
         borderRadius: BorderRadius.only(topRight: Radius.circular(24,),topLeft: Radius.circular(24))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: GNav(
          padding: const EdgeInsets.all(16,),
          tabBorderRadius: 50,
          curve: Curves.bounceOut,
          onTabChange: (index) =>onDestinationSelected(index),
          backgroundColor:AppColors.darkerWhite,
          activeColor: Colors.white,
          tabBackgroundColor:AppColors.primary,
          gap: 8,
          duration: const Duration(milliseconds: 300,),
          color: Colors.black,
          tabs: const [

            GButton(icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(icon: Icons.category_outlined,
              text: 'Categories',
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: 'Account',),



          ],
        ),
      ),
    );
  }
}
