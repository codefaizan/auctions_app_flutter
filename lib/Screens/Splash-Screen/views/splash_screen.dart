import 'dart:async';
import 'package:bidding_app/Screens/Onboarding-Screen/views/onboarding_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      print('splash');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OnboardingScreen(),
              settings: const RouteSettings(name: '/signup')));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo,height: FetchPixels.getPixelHeight(65)),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            BoldTextWidget(text: AppTexts.appName),
          ],
        ),
      ),
    );
  }
}
