import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:flutter/material.dart';

class AuctionForm extends StatelessWidget {
  const AuctionForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        TextFormField(decoration: const InputDecoration(hintText: AppTexts.name)),
        SizedBox(height: FetchPixels.getPixelHeight(10)),
        TextFormField(decoration: const InputDecoration(hintText: AppTexts.startingPrice)),
        SizedBox(height: FetchPixels.getPixelHeight(10)),
        TextFormField(decoration: const InputDecoration(hintText: AppTexts.minimumPrice)),
        SizedBox(height: FetchPixels.getPixelHeight(10)),
        TextFormField(decoration: const InputDecoration(hintText: AppTexts.duration)),
      ],
    ));
  }
}