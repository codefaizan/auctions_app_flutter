import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
          children: [
    TextFormField(decoration: const InputDecoration(hintText: AppTexts.name)),
    SizedBox(height: FetchPixels.getPixelHeight(10)),
    TextFormField(decoration: const InputDecoration(hintText: AppTexts.price)),
    SizedBox(height: FetchPixels.getPixelHeight(10)),
    TextFormField(decoration: const InputDecoration(hintText: AppTexts.category)),
    SizedBox(height: FetchPixels.getPixelHeight(10)),
    TextFormField(decoration: const InputDecoration(hintText: AppTexts.brand)),
          ],
        ));
  }
}