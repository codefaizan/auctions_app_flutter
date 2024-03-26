import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? titleLabel;
  final Widget? suffix;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;

  const TextFieldWidget({super.key, this.titleLabel, this.suffix, this.obscureText=false, this.controller, this.keyboardType, this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: titleLabel,
        suffixIcon: suffix,
        // contentPadding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15), horizontal: FetchPixels.getPixelWidth(15)),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(15))),
      ),
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,

    );
  }
}