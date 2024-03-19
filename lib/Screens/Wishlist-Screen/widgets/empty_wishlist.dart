import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyWishlistScreen extends StatelessWidget {
  const EmptyWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.wishlistIcon, height: FetchPixels.getPixelHeight(150),),
        SizedBox(
          height: FetchPixels.getPixelHeight(20),
        ),
        RegularTextWidget(
          text: AppTexts.wishlistIsEmpty,
          fontSize: FetchPixels.getPixelHeight(19)
        ),
        SizedBox(
          height: FetchPixels.getPixelHeight(20),
        ),
        ElevatedButton(
            onPressed: () {},
            child: BoldTextWidget(
              text: AppTexts.addNow,
            )),
      ],
    );
  }
}
