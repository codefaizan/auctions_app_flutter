import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool obscureTextPasswordSignup=true;
  bool obscureTextConfirmPasswordSignup=true;

  bool obscureTextPasswordLogin=true;

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

  

  update() {
    notifyListeners();
  }
}