import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/form_field_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/Bottom-Nav-Bar/bottom_nav_bar.dart';
import 'package:bidding_app/Screens/Auth/Forgot-Password-Screen/views/reset_password_screen.dart';
import 'package:bidding_app/Screens/Auth/Signup-Screen/views/signup_screen.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: FetchPixels.getPixelHeight(20),
                horizontal: FetchPixels.getPixelWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getAssetImage(
                        AppImages.logo,
                        height: FetchPixels.getPixelHeight(45),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(15),
                      ),
                      BoldTextWidget(
                          text: AppTexts.appName,
                          fontSize: FetchPixels.getPixelHeight(22)),
                    ],
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(150),
                  ),
              
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormFieldWidget(
                          KeyboardType: TextInputType.emailAddress,
                          validator: (value) => provider.validateEmail(value),
                          titleLabel: AppTexts.email,
                        ),
                        SizedBox(height: FetchPixels.getPixelHeight(15)),
                        FormFieldWidget(
                          KeyboardType: TextInputType.visiblePassword,
                          validator: (value) => provider.validateEmptyField(value),
                          titleLabel: AppTexts.password,
                        obscureText: provider.obscureTextPasswordLogin,
                        suffix: IconButton(
                              onPressed: () => provider.togglePasswordLogin(),
                              icon: Icon((provider.obscureTextPasswordLogin)
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                                  ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResetPasswordScreen()));
                              },
                              child: RegularTextWidget(
                                  text: AppTexts.forgotPasswordQMark)),
                        ),
                        SizedBox(height: FetchPixels.getPixelHeight(20)),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BottomBar()));
                            }
                          },
                          child: BoldTextWidget(text: AppTexts.login),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(80),
                  ),
                  RegularTextWidget(
                    text: AppTexts.dontHaveAccount,
                    fontSize: FetchPixels.getPixelHeight(18),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(15),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: BoldTextWidget(text: AppTexts.signup),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
