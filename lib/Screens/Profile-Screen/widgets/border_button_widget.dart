import 'package:flutter/material.dart';

import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/resources/resources.dart';
import '../../../widgets/text_widget.dart';

Widget expandedButtonWidget(String text, Function() onPressed, [Color? color]){
  return OutlinedButton(onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(12), vertical: FetchPixels.getPixelHeight(13)),
      side: BorderSide(color: R.colors.greyColor),
      alignment: Alignment.centerLeft,
      foregroundColor: R.colors.blackColor,
    ),
    child: RegularTextWidget(
      text: text,
      fontSize: FetchPixels.getPixelHeight(19),
      color: color,
    ),
  );
}