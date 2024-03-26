import 'package:bidding_app/base/resources/resources.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  InputDecoration textFormFieldDecoration(
    Widget? suffix,
    String hintText,
  ) {
    return InputDecoration(

      suffixIcon: suffix,
      isDense: true,
      labelStyle: R.textStyle.regularMontserrat(),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
          width: 1,
          color: R.colors.theme,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(width: 1, color: R.colors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(width: 1, color: R.colors.borderColor),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: R.colors.borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      filled: true,
      fillColor: R.colors.whiteColor,
      focusColor: R.colors.theme,
      hintText: hintText,

      hintStyle: R.textStyle
          .mediumMontserrat()
          .copyWith(fontSize: 13, color: R.colors.hintText),


      //  border: OutlineInputBorder()
    );
  }
}
