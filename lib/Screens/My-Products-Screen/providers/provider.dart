import 'package:flutter/material.dart';

class productDetailProvider extends ChangeNotifier{
  bool isFavourite = false;

  toggleFavourite(){
    isFavourite = !isFavourite;
    notifyListeners();
  }
}