import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/resources.dart';
import 'package:flutter/material.dart';

// const Color defaultThemeColor = Color(0xffe28502);
ThemeData defaultTheme = ThemeData(
  //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  colorScheme: ColorScheme.light(
      primary: R.colors.theme, secondary: R.colors.theme),
  primaryColor: R.colors.theme,

  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    contentPadding:
    EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15), horizontal: FetchPixels.getPixelWidth(15)),
    hintStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(17),fontFamily: 'Glacial', color: R.colors.greyColor, fontWeight: FontWeight.bold),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 170, 167, 167),
        ),
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(9))
    ),
        labelStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(17),fontFamily: 'Glacial'),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: R.colors.theme),
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(9))
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: R.colors.theme,
          foregroundColor: R.colors.whiteColor,
          minimumSize: Size.fromHeight(FetchPixels.getPixelWidth(45)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(8))),
          textStyle: TextStyle(fontFamily: 'Krona', fontSize: FetchPixels.getPixelHeight(17) ))),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: R.colors.theme,
        side:
            BorderSide(color: R.colors.theme, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(8))),
        minimumSize: Size.fromHeight(FetchPixels.getPixelHeight(45)),
        textStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(17), fontFamily: 'Krona')),
  ),
  
  chipTheme: ChipThemeData(
    selectedColor: R.colors.theme,
  ),

  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(R.colors.blackColor),
      textStyle: MaterialStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w400, fontSize: FetchPixels.getPixelHeight(19))),
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => Image.asset(
      'assets/icons/back_icon.png',
      height: 50,
    ),
  ),
);
