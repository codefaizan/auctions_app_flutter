import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:bidding_app/Screens/Auth/Signup-Screen/widgets/input_text_field_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/Bottom-Nav-Bar/bottom_nav_bar.dart';
import 'package:bidding_app/Screens/Auth/Login-Screen/views/login_screen.dart';
import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class SignupScreen extends StatelessWidget {

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logo,
                        height: FetchPixels.getPixelHeight(45),
                      ),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(15),
                      ),
                      BoldTextWidget(
                          text: AppTexts.appName,
                          fontSize: FetchPixels.getPixelHeight(22))
                    ],
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(50),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputTextField(
                            titleLabel: AppTexts.name,
                            validator: (value) => provider.validateEmptyField(value),
                          ),
                          SizedBox(
                            height: FetchPixels.getPixelHeight(15),
                          ),
                          InputTextField(
                            titleLabel: AppTexts.email,
                            validator: (value) => provider.validateEmail(value),
                          ),
                          SizedBox(
                            height: FetchPixels.getPixelHeight(15),
                          ),
                          InputTextField(
                            titleLabel: AppTexts.phNumber,
                            validator: (value) => provider.validatePhoneNumber(value),
                          ),
                          SizedBox(
                            height: FetchPixels.getPixelHeight(15),
                          ),
                          InputTextField(

                            titleLabel: AppTexts.password,
                            obscureText: provider.obscureTextPasswordSignup,
                            suffix: IconButton(
                                onPressed: () =>
                                    provider.togglePasswordSignup(),
                                icon: Icon(provider.obscureTextPasswordSignup
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            validator: (value) => provider.validatePasswordStrength(value),
                            controller: provider.passwordController,
                          ),
                          SizedBox(
                            height: FetchPixels.getPixelHeight(15),
                          ),
                          InputTextField(
                            titleLabel: AppTexts.confirmPassword,
                            validator: (value) => provider.validateMatchPassword(value),
                            controller: provider.confirmPasswordController,
                            obscureText:
                                provider.obscureTextConfirmPasswordSignup,
                            suffix: IconButton(
                                onPressed: () =>
                                    provider.toggleConfirmPasswordSignup(),
                                icon: Icon(
                                    provider.obscureTextConfirmPasswordSignup
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                          ),
                          SizedBox(
                            height: FetchPixels.getPixelHeight(30),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomBar()),
                                        (route) => false,
                                      );
                                      Navigator.pop(context);
                                    });
                                    return SuccessPopup(
                                        title: AppTexts.congratulations,
                                        subTitle: AppTexts
                                            .accountCreatedSuccessfully);
                                  },
                                );
                              }
                            },
                            child: BoldTextWidget(
                              text: AppTexts.signup,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(75),
                  ),
                  RegularTextWidget(
                    text: AppTexts.alreadyHaveAccount,
                    fontSize: FetchPixels.getPixelHeight(18),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(15)),
                  OutlinedButton(
                    onPressed: () {
                      provider.passwordController.clear();
                      provider.confirmPasswordController.clear();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                              settings: const RouteSettings(name: '/login')));
                    },
                    child: BoldTextWidget(text: AppTexts.login),
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
