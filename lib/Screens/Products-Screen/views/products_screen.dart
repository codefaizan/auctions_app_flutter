import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.products,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),


          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(25)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getAssetImage(AppImages.productsIcon),
              SizedBox(height: FetchPixels.getPixelHeight(20)),
              RegularTextWidget(text: AppTexts.dontHaveAnyProduct, fontSize: FetchPixels.getPixelHeight(19)),
              SizedBox(height: FetchPixels.getPixelHeight(20)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: R.colors.whiteColor,
                    backgroundColor: R.colors.theme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  child: BoldTextWidget(text: AppTexts.addNow),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
