  import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_field_widget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (buildContext) => BSheet());
  }


class BSheet extends StatelessWidget {
  const BSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
          padding: EdgeInsets.only(left: FetchPixels.getPixelWidth(20),right: FetchPixels.getPixelWidth(20),bottom: mediaQueryData.viewInsets.bottom, top: FetchPixels.getPixelHeight(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: BoldTextWidget(
                text: AppTexts.placeYourBid,
                fontSize: FetchPixels.getPixelHeight(21))
              ),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              RegularTextWidget(
                text: AppTexts.writeYourBidPrice,
                fontSize: FetchPixels.getPixelHeight(15)
              ),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              TextFieldWidget(hintText: AppTexts.price,),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: AppTexts.price,
              //   ),
              // ),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              TextFieldWidget(hintText: AppTexts.description,),
              // TextField(
              //   decoration: InputDecoration(hintText: AppTexts.description),
              // ),
              getVerSpace(FetchPixels.getPixelHeight(10)),
              ElevatedButton(
                onPressed: () {},
                child: BoldTextWidget(
                  text: AppTexts.placeBid,
                ),
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
            ],
          ),
        );
  }
}