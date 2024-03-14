import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final titleLabel;
  final Widget? suffix;
  bool obscureText;
  String? Function(String?)? validator;

  InputTextField({super.key, required this.titleLabel, this.suffix, this.obscureText=true, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: titleLabel,
          suffixIcon: suffix,
          contentPadding:
              EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15), horizontal: FetchPixels.getPixelWidth(15)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(15))),
        ),
        obscureText: obscureText,

        validator: validator
        // (value) {
        //   if (value == null || value.isEmpty) {
        //     return AppTexts.fieldCantBeEmpty;
        //   }
        //   return null;
        // }
        );
  }
}