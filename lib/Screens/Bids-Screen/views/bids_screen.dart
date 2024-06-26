import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class BidsScreen extends StatelessWidget {
  const BidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.bids,
            fontSize: FetchPixels.getPixelHeight(22),
          ),
          centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(25)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getAssetImage(AppImages.bidIcon),
              SizedBox(
                height: FetchPixels.getPixelHeight(20),
              ),
              RegularTextWidget(text: AppTexts.dontHaveAnyBids, fontSize: FetchPixels.getPixelHeight(19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
