import 'package:flutter/material.dart';

import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/resources/app_texts.dart';
import '../../../widgets/text_widget.dart';

void profileBottomSheet(String title, String subTitle, BuildContext context, void onYesOption()?, void onNoOption()?) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext) => Container(
        padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(25), horizontal: FetchPixels.getPixelWidth(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            BoldTextWidget(text: title, fontSize:FetchPixels.getPixelHeight (22)),
            SizedBox(height: FetchPixels.getPixelHeight(10),),
            RegularTextWidget(text: subTitle, fontSize: FetchPixels.getPixelHeight(17)),
            SizedBox(height: FetchPixels.getPixelHeight(10),),
            ElevatedButton(
              onPressed: onNoOption,
              child: BoldTextWidget(
                text: AppTexts.no,
              ),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10),),
            OutlinedButton(
              onPressed: onYesOption,
              child: BoldTextWidget(
                text: AppTexts.yes,
              ),
            )
          ],
        ),
      ));
}