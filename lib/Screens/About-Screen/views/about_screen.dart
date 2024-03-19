import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget{
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(text: AppTexts.aboutUs, fontSize: FetchPixels.getPixelHeight(22)),
        centerTitle: true,
        
      ),

      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: RegularTextWidget(text: AppTexts.aboutDetail),
      ),
    );
  }

}