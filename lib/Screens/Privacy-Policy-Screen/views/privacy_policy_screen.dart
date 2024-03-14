import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget{
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.termsPrivacy,
          fontSize: FetchPixels.getPixelHeight(22)
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: RegularTextWidget(text: AppTexts.termsPrivacyDetail),
      ),
    );
  }
  
}