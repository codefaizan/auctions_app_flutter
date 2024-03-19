  import 'package:bidding_app/resources/app_texts.dart';
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
          padding: EdgeInsets.only(left: 20,right: 20,bottom: mediaQueryData.viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: BoldTextWidget(
                text: AppTexts.placeYourBid,
                fontSize: 20)
              ),
              SizedBox(height: 10,),
              RegularTextWidget(
                text: AppTexts.writeYourBidPrice,
                fontSize: 15
              ),
              SizedBox(height: 10,),
              const SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppTexts.price,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              const SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(hintText: AppTexts.description),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {},
                child: BoldTextWidget(
                  text: AppTexts.placeBid,
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        );
  }
}