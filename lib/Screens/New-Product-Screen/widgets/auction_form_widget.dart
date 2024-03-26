import 'package:bidding_app/Screens/Filters-Screen/views/filters_screen.dart';
import 'package:bidding_app/Screens/New-Product-Screen/provider.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/form_field_widget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class AuctionForm extends StatelessWidget {
  NewProductProvider provider = NewProductProvider();
  final GlobalKey formKey;

  AuctionForm({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
        child: Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
                hintText: AppTexts.category,
              hintStyle: TextStyle(color: R.colors.blackColor, fontWeight: FontWeight.normal)
            ),
            items:List.generate(categories.length, (index) => DropdownMenuItem(child: RegularTextWidget(text: categories[index]), value: index-1,)),
            onChanged: (onChanged){}),
        getVerSpace(FetchPixels.getPixelHeight(10)),
        FormFieldWidget(hintText: AppTexts.name, validator: (value) => provider.validateEmptyField(value),),
        getVerSpace(FetchPixels.getPixelHeight(10)),
        FormFieldWidget(hintText: AppTexts.startingPrice, validator: (value) => provider.validateEmptyField(value)),
        getVerSpace(FetchPixels.getPixelHeight(10),),
        FormFieldWidget(hintText: AppTexts.minimumPrice, validator: (value) => provider.validateEmptyField(value)),
        getVerSpace(FetchPixels.getPixelHeight(10)),
        DropdownButtonFormField(
            decoration: InputDecoration(
                hintText: AppTexts.duration,
                hintStyle: TextStyle(color: R.colors.blackColor, fontWeight: FontWeight.normal)),
            items:List.generate(duration.length, (index) => DropdownMenuItem(child: RegularTextWidget(text: duration[index]), value: index-1,)),
            onChanged: (onChanged){}),
        getVerSpace(FetchPixels.getPixelHeight(10)),
        FormFieldWidget(hintText: 'City', validator: (value) => provider.validateEmptyField(value)),
        getVerSpace(FetchPixels.getPixelHeight(10)),
        FormFieldWidget(hintText: AppTexts.description, validator: (value) => provider.validateEmptyField(value)),

      ],
    ));
  }

  final List<String> duration = ['4 hours', '6 hours', '8 hours','1 Day', '2 Days', '3 Days', '4 Days', '5 Days'];
}