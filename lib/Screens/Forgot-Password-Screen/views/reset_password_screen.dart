import 'package:bidding_app/Screens/Forgot-Password-Screen/views/otp_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';


// 1st screen for Forgot Password
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text:AppTexts.forgotPassword,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),

          body: Padding(padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(20), horizontal: FetchPixels.getPixelWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            RegularTextWidget(text:AppTexts.resetPassword, fontSize: FetchPixels.getPixelHeight(25),),
            SizedBox(height: FetchPixels.getPixelHeight(15),),
            RegularTextWidget(text: AppTexts.enterEmailForPasswordReset, fontSize: FetchPixels.getPixelHeight(16),),
            SizedBox(height: FetchPixels.getPixelHeight(70),),
            const TextField(decoration: InputDecoration(hintText: AppTexts.email, hintStyle: TextStyle(color: Colors.grey)),),
            SizedBox(height: FetchPixels.getPixelHeight(70),),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
              },
              child: BoldTextWidget(text: AppTexts.sendLink),
            ),
          ],),),
          
    );
  }
}
