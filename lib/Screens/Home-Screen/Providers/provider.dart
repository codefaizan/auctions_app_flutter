import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool? isFavourite;

  toggleFavourite(){
    if(isFavourite==true){
      isFavourite=false;
    }
    else{
      isFavourite=true;
    }
    notifyListeners();
  }

  update() {
    notifyListeners();
  }
}
