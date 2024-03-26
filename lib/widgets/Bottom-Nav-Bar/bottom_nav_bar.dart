import 'package:bidding_app/Screens/Home-Screen/views/home_screen.dart';
import 'package:bidding_app/Screens/My-Products-Screen/views/my_products_screen.dart';
import 'package:bidding_app/Screens/Profile-Screen/views/profile_screen.dart';
import 'package:bidding_app/Screens/Wishlist-Screen/views/wishlist_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../base/resources/resources.dart';

class BottomBar extends StatefulWidget{
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex=0;
  
  List<Widget> screensList = [
    HomeScreen(),
    const MyProductsScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: R.colors.blackColor,
        backgroundColor: R.colors.whiteColor,
        disableDefaultTabController: true,
        initialActiveIndex: 0,

        onTap: _onButtonTap,

        items: [
          TabItem(icon: Image.asset(AppImages.logo, color: R.colors
          .blackColor), title: '', activeIcon: Image.asset('assets/icons/nav_icon.png',)),
          TabItem(icon: Icons.camera, title: '', activeIcon: Icon(Icons.camera, color: R.colors.theme, size: 45),isIconBlend: EditableText.debugDeterministicCursor, ),
          TabItem(icon: Icons.favorite, title: '', activeIcon: Icon(Icons.favorite, color: R.colors.theme, size: 45),isIconBlend: EditableText.debugDeterministicCursor),
          TabItem(icon: Icons.person, title: '', activeIcon: Icon(Icons.person, color: R.colors.theme,size: 45,), isIconBlend: EditableText.debugDeterministicCursor),
        ],

      ),

      // BottomNavigationBar(
      //     iconSize: 30,
      //     selectedFontSize: 0,
      //     unselectedFontSize: 0,
      //     selectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 226, 133, 2), size: 50),
      //     unselectedIconTheme: const IconThemeData(color: Colors.black,),
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     currentIndex: _selectedIndex,
      //
      //     onTap: _onButtonTap,
      //     //type: BottomNavigationBarType.shifting,
      //
      //
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'home',),
      //     BottomNavigationBarItem(icon: Icon(Icons.edit,), label: 'edit'),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: 'wishlist'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'profile')
      //   ]),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(20)),
          child: screensList[_selectedIndex],
        )
    );
  }

  void _onButtonTap(index){
    setState((){
      _selectedIndex = index;
    });
  }
}