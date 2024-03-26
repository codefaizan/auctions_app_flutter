import 'package:bidding_app/Models/ProfileData.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends ChangeNotifier {
  XFile? pickedImage;
  bool updateData([String? newName, String? newPhone]) {
    demoProfileData.name = newName ?? demoProfileData.name;
    demoProfileData.phoneNumber = newPhone ?? demoProfileData.phoneNumber;
    return true;
  }

  Future<bool> pickImage() async {
    final XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      pickedImage = selectedImage;
      notifyListeners();
      return true;
    }
    return false;
  }
}
