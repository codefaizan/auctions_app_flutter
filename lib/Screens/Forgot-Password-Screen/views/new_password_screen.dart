import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';


// 3rd screen for Forgot Password
class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.forgotPassword,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),

          body: Padding(padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(20), horizontal: FetchPixels.getPixelHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            RegularTextWidget(text: AppTexts.enterNewPassword, fontSize: FetchPixels.getPixelHeight(25)),
            SizedBox(height: FetchPixels.getPixelHeight(70),),
            const TextField(decoration: InputDecoration(hintText: AppTexts.newPassword, hintStyle: TextStyle(color: Colors.grey)),),
            SizedBox(height: FetchPixels.getPixelHeight(20)),
            const TextField(decoration: InputDecoration(hintText: AppTexts.confirmPassword, hintStyle: TextStyle(color: Colors.grey)),),
            SizedBox(height: FetchPixels.getPixelHeight(70)),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.popUntil(context, (route) => route.settings.name == "/login");
                    });
                    return SuccessPopup(
                      title: AppTexts.updateEMark,
                      subTitle:
                          AppTexts.passwordUpdated,
                    );
                  },
                );
              },
              child: BoldTextWidget(text: AppTexts.update),
            ),
          ],),),
          
    );
  }
}
