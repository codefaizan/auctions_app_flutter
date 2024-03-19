import 'package:bidding_app/resources/app_texts.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool obscureTextPasswordSignup=true;
  bool obscureTextConfirmPasswordSignup=true;

  bool obscureTextPasswordLogin=true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  togglePasswordSignup(){
    //           show/hide password
    obscureTextPasswordSignup = !obscureTextPasswordSignup;
    notifyListeners();
  }

  toggleConfirmPasswordSignup(){
    //          show/hide confirm password 
    obscureTextConfirmPasswordSignup = !obscureTextConfirmPasswordSignup;
    notifyListeners();
  }

  togglePasswordLogin(){
    //          show/hide confirm password 
    obscureTextPasswordLogin= !obscureTextPasswordLogin;
    notifyListeners();
  }

  String? validateEmail(String? value){
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? AppTexts.enterValidEmail
        : null;
  }

  String? validatePhoneNumber(String? value){
    String pattern = r'(^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty || !regExp.hasMatch(value)) {
      return AppTexts.enterValidPhoneNumber;
    }
    return null;
  }

  String? validatePasswordStrength(String? value){
    passwordController.text = value!;
    String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)';
    RegExp regExp = RegExp(pattern);
    if(value!.isEmpty){
      return AppTexts.passwordCantBeEmpty;
    }
    else if(!regExp.hasMatch(value)){
      return AppTexts.enterStrongPassword;
    }
    return null;
  }
  String? validateMatchPassword(String? value){
    confirmPasswordController.text = value!;
    if(passwordController.text == confirmPasswordController.text){
      return null;
    }
    return AppTexts.passwordNotMatch;
  }

  String? validateEmptyField(String? value){
    if(value!.isEmpty){
      return AppTexts.fieldCantBeEmpty;
    }
    return null;
  }
  

  update() {
    notifyListeners();
  }
}