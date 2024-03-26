import 'package:bidding_app/Screens/Auth/Providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Flexible OtpFieldWidget(BuildContext context, AuthProvider provider,
    [TextEditingController? controller]) {
  return Flexible(
    child: TextField(
      controller: controller,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        else if(value.length ==0){
          FocusScope.of(context).previousFocus();
        }
      },
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
    ),
  );
}