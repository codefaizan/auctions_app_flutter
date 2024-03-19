import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/resources/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.paymentMethods,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularTextWidget(text: AppTexts.selectPaymentMethod, fontSize: FetchPixels.getPixelHeight(19)),
            SizedBox(height: FetchPixels.getPixelHeight(20),),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(7), vertical: FetchPixels.getPixelHeight(10)),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
              ),
              leading: Image.asset(AppImages.paypalIcon),
              trailing: Radio(value: 1, groupValue: 1, onChanged: (onChanged){}, activeColor: Colors.black,),
            ),

            SizedBox(height: FetchPixels.getPixelHeight(230),),

            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 5), () {
                      Navigator.of(context).pop();
                    });
                    return SuccessPopup(
                      title: AppTexts.congratulations,
                      subTitle:
                          AppTexts.paymentHasConfirmed,
                    );
                  },
                );
              },
              child: BoldTextWidget(text: AppTexts.confirmPayment),
            ),
          ],
        ),
      ),
    );
  }
}
