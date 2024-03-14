import 'package:bidding_app/Screens/Auth/Signup-Screen/views/signup_screen.dart';
import 'package:bidding_app/Screens/Home-Screen/Providers/provider.dart';
import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/Screens/Splash-Screen/views/splash_screen.dart';
import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // screenHeight = MediaQuery.of(context).size.height;
    // screenWidth = MediaQuery.of(context).size.width;
    FetchPixels(context);
    
      return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: defaultTheme,
        // home: LoginScreen(),
        home: SignupScreen(),
        // home: MessagesScreen(),
      )
      );
    
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
    );
  }
}
