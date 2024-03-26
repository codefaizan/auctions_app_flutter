import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class TextWrapWidget extends StatefulWidget {
  final String text;

  const TextWrapWidget({
    super.key,
    required this.text
  });

  @override
  State<TextWrapWidget> createState() => _TextWrapWidgetState();
}

class _TextWrapWidgetState extends State<TextWrapWidget> {
  late String firstHalf;
  late String secondHalf;
  bool isWrapped = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 40) {
      firstHalf = widget.text.substring(0, 40);
      secondHalf = widget.text.substring(40, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return
    (isWrapped)?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: RegularTextWidget(text: "$firstHalf...", fontSize: FetchPixels.getPixelHeight(18))),
        InkWell(
          onTap: (){
            isWrapped=false;
            setState(() {
              
            });
          },
          child: RegularTextWidget(text: AppTexts.readMore, color: R.colors.theme),),
      ],
    )
    :
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RegularTextWidget(text: firstHalf + secondHalf, fontSize: FetchPixels.getPixelHeight(18)),
        InkWell(
          onTap: (){
            isWrapped=true;
            setState(() {
              
            });
          },
          child: RegularTextWidget(text: AppTexts.showLess, color: R.colors.theme,)),
      ],
    );

  }
}