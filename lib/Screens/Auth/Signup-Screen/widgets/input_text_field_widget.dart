import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String? titleLabel;
  final Widget? suffix;
  bool obscureText;
  String? Function(String?)? validator;
  TextEditingController? controller;

  InputTextField({super.key, this.titleLabel, this.suffix, this.obscureText=false, this.validator, this.controller});
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
        controller: controller,
        validator: validator,
        );
  }
}