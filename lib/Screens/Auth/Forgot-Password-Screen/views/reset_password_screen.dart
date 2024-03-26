import 'package:bidding_app/Screens/Auth/Forgot-Password-Screen/views/otp_screen.dart';
import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/form_field_widget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


  final _formKey = GlobalKey<FormState>();
// 1st screen for Forgot Password
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {


    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text:AppTexts.forgotPassword,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),

          body: Padding(padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(20), horizontal: FetchPixels.getPixelWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              RegularTextWidget(text:AppTexts.resetPassword, fontSize: FetchPixels.getPixelHeight(25),),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              RegularTextWidget(text: AppTexts.enterEmailForPasswordReset, fontSize: FetchPixels.getPixelHeight(16),),
                getVerSpace(FetchPixels.getPixelHeight(70)),
                Form(
                  key: _formKey,
                  child: FormFieldWidget(
                    titleLabel: AppTexts.email,
                    validator: (value) => provider.validateEmail(value),
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(70)),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
                  }
                },
                child: BoldTextWidget(text: AppTexts.sendLink),
              ),
            ],),
          ),),
          
    );
    },);
  }
}
