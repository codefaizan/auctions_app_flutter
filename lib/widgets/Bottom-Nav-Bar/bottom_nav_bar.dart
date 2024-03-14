import 'package:bidding_app/Screens/Home-Screen/views/home_screen.dart';
import 'package:bidding_app/Screens/My-Products-Screen/views/my_products_screen.dart';
import 'package:bidding_app/Screens/Profile-Screen/views/profile_screen.dart';
import 'package:bidding_app/Screens/Wishlist-Screen/views/wishlist_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget{
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex=0;
  
  List<Widget> screensList = [
    const HomeScreen(),
    const MyProductsScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 226, 133, 2), size: 50),
          unselectedIconTheme: const IconThemeData(color: Colors.black,),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
      
          onTap: _onButtonTap,
          //type: BottomNavigationBarType.shifting,
          
          
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'home',),
          BottomNavigationBarItem(icon: Icon(Icons.edit,), label: 'edit'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: 'wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'profile')
        ]),

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