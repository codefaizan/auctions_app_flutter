import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/form_field_widget.dart';
import 'package:bidding_app/widgets/text_field_widget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (buildContext) => BSheet());
}

 final _formKey = GlobalKey<FormState>();
class BSheet extends StatelessWidget {
  const BSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    AuthProvider auth = AuthProvider();
    return Container(
      padding: EdgeInsets.only(left: FetchPixels.getPixelWidth(20),right: FetchPixels.getPixelWidth(20),bottom: mediaQueryData.viewInsets.bottom, top: FetchPixels.getPixelHeight(10)),
      child: Form(
        key: _formKey,
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
            FormFieldWidget(hintText: AppTexts.price, validator: (value) => auth.validateEmptyField(value),KeyboardType: TextInputType.number,),

            getVerSpace(FetchPixels.getPixelHeight(10)),
            FormFieldWidget(hintText: AppTexts.description,validator: (value) => auth.validateEmptyField(value),),
            // TextField(
            //   decoration: InputDecoration(hintText: AppTexts.description),
            // ),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  Navigator.pop(context);
                }
              },
              child: BoldTextWidget(
                text: AppTexts.placeBid,
              ),
            ),
            getVerSpace(FetchPixels.getPixelHeight(20)),
          ],
        ),
      ),
    );
  }
}