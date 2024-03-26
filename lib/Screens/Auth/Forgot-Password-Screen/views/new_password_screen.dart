import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/form_field_widget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// 3rd screen for Forgot Password
class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      
    
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
            getVerSpace(FetchPixels.getPixelHeight(70)),
            FormFieldWidget(titleLabel:AppTexts.newPassword,
            controller: passwordController,
            validator: (value) => provider.validatePasswordStrength(value)),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              FormFieldWidget(titleLabel:AppTexts.confirmPassword,
              validator: (value) => provider.validateMatchPassword(value, passwordController, confirmPasswordController),
                controller: confirmPasswordController,),
              getVerSpace(FetchPixels.getPixelHeight(70)),
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
    },);
  }
}
