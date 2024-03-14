import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

const Color defaultThemeColor = Color.fromARGB(255, 226, 133, 2);
ThemeData defaultTheme = ThemeData(
  //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  colorScheme: const ColorScheme.light(
      primary: defaultThemeColor, secondary: defaultThemeColor),
  primaryColor: const Color.fromARGB(255, 226, 133, 2),

  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 170, 167, 167),
        ),
        borderRadius: BorderRadius.circular(15)),
        labelStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(17),fontFamily: 'Glacial'),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: defaultThemeColor),
        borderRadius: BorderRadius.circular(12)),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: defaultThemeColor,
          foregroundColor: Colors.white,
          minimumSize: Size.fromHeight(FetchPixels.getPixelWidth(45)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: TextStyle(fontFamily: 'Krona', fontSize: FetchPixels.getPixelHeight(17) ))),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: defaultThemeColor,
        side:
            const BorderSide(color: defaultThemeColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: Size.fromHeight(FetchPixels.getPixelWidth(45)),
        textStyle: TextStyle(fontSize: FetchPixels.getPixelHeight(17), fontFamily: 'Krona')),
  ),
  
  chipTheme: const ChipThemeData(
    selectedColor: defaultThemeColor,
  ),

  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      textStyle: MaterialStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w400, fontSize: 17)),
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => Image.asset(
      'assets/icons/back_icon.png',
      height: 50,
    ),
  ),
);
