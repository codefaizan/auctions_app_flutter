import 'package:bidding_app/Screens/Auth/Forgot-Password-Screen/views/new_password_screen.dart';
import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/form_field_widget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widgets/otp_field_widget.dart';

// 2nd screen for Forgot Password
class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool invalidOtp = false;

  final TextEditingController txt1 = TextEditingController();

  final TextEditingController txt2 = TextEditingController();

  final TextEditingController txt3 = TextEditingController();

  final TextEditingController txt4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
              title: BoldTextWidget(
                  text: AppTexts.forgotPassword,
                  fontSize: FetchPixels.getPixelHeight(22)),
              centerTitle: true),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: FetchPixels.getPixelHeight(20),
                horizontal: FetchPixels.getPixelWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: FetchPixels.getPixelHeight(80),
                  ),
                  RegularTextWidget(
                      text: AppTexts.codeSentForPasswordReset,
                      fontSize: FetchPixels.getPixelHeight(20)),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(80),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OtpFieldWidget(context, provider, txt1),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(10),
                      ),
                      OtpFieldWidget(context, provider, txt2),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(10),
                      ),
                      OtpFieldWidget(context, provider, txt3),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(10),
                      ),
                      OtpFieldWidget(context, provider, txt4),
                    ],
                  ),
                  RegularTextWidget(text: invalidOtp ? 'Invalid OTP' : ''),
                  const SizedBox(
                    height: 80,
                  ),
                  RegularTextWidget(text: AppTexts.resendCode),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String otp =
                          txt1.text + txt2.text + txt3.text + txt4.text;
                      invalidOtp = provider.validateOtp(otp);
                      if (!invalidOtp) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewPasswordScreen()));
                      }
                      provider.update();
                    },
                    child: BoldTextWidget(text: AppTexts.verify),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
