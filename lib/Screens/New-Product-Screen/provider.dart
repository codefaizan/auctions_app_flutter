import 'dart:io';

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

}