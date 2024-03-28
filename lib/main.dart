 import 'package:bidding_app/Screens/Auction-Detail-Screen/providers/provider.dart';
import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/Screens/Chats-Screen/Providers/provider.dart';
import 'package:bidding_app/Screens/Edit-Profile-Screen/Providers/provider.dart';
import 'package:bidding_app/Screens/Home-Screen/providers/provider.dart';
import 'package:bidding_app/Screens/My-Products-Screen/providers/provider.dart';
import 'package:bidding_app/Screens/New-Product-Screen/provider.dart';
import 'package:bidding_app/Screens/Splash-Screen/views/splash_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/widgets/Bottom-Nav-Bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   FetchPixels(context);

      return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ChatsProvider()),
        ChangeNotifierProvider(create: (context) => NewProductProvider()),
        ChangeNotifierProvider(create: (context) => productDetailProvider()),
        ChangeNotifierProvider(create: (context) => AuctionDetailProvider()),
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hauptsache-Platz',
        home:SplashScreen(),
        theme: DefaultTheme.getThemeData(),
      //  home: const SplashScreen(),
      )
      );
    
  }
}
