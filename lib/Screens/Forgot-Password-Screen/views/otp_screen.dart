import 'package:bidding_app/Screens/Forgot-Password-Screen/views/new_password_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 2nd screen for Forgot Password
class OTPScreen extends StatelessWidget{
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.forgotPassword,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),
          
      body: Padding(padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(20), horizontal: FetchPixels.getPixelWidth(20)),
          child: Column(
            children: [
              SizedBox(height: FetchPixels.getPixelHeight(80),),
            RegularTextWidget(text: AppTexts.codeSentForPasswordReset, fontSize: FetchPixels.getPixelHeight(20)),
            SizedBox(height: FetchPixels.getPixelHeight(80),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Flexible(
              child: TextFormField(
                onChanged: (value) {
                  if(value.length==1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            SizedBox(width: FetchPixels.getPixelWidth(10),),
            Flexible(
              child: TextFormField(
                onChanged: (value) {
                  if(value.length==1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            SizedBox(width: FetchPixels.getPixelWidth(10),),
            Flexible(
              child: TextFormField(
                onChanged: (value) {
                  if(value.length==1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            SizedBox(width: FetchPixels.getPixelWidth(10),),
            Flexible(
              child: TextFormField(
                onChanged: (value) {
                  if(value.length==1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
              ),
            ),

            ],),
            const SizedBox(height: 80,),
            RegularTextWidget(text: AppTexts.resendCode),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const NewPasswordScreen()));
              },
              child: BoldTextWidget(text: AppTexts.verify),
            ),
          ],),),
    );
  }
  
}