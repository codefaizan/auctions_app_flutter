import 'package:flutter/cupertino.dart';

import '../resources/resources.dart';

class AppTextStyle {
  ///textstyles///

  TextStyle regularMontserrat() {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'Montserrat',
      letterSpacing: 0.05,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w400,
    );
  }
  TextStyle mediumMontserrat() {
    return TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat',
      letterSpacing: 0,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle semiBoldMontserrat() {
    return TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat',
      letterSpacing: 0,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w600,
    );
  }
  TextStyle boldMontserrat() {
    return TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat',
      letterSpacing: 0,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w700,
    );
  }



}
