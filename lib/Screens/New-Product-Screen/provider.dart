import 'dart:io';

import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewProductProvider extends ChangeNotifier{
List<XFile>? pickedImages = [];
bool isAuctionForm = true;

Future pickImage() async{

  final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
  if (selectedImages!.isNotEmpty) {
    pickedImages!.addAll(selectedImages);
  }
  notifyListeners();
}

removeImage(int index){
  pickedImages!.removeAt(index);
  notifyListeners();
}

changeForm(bool newValue){
  isAuctionForm = newValue;
  notifyListeners();
}

validateEmptyField(String? value){
  if(value!.isEmpty){
    return AppTexts.fieldCantBeEmpty;
  }
  return null;

}


}