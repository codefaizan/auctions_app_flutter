import 'package:bidding_app/Models/ProfileData.dart';
import 'package:bidding_app/Screens/Edit-Profile-Screen/Providers/provider.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/resources/app_texts.dart';
import '../../../base/resources/resources.dart';
import '../../../widgets/text_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController  _phoneController = TextEditingController();
  bool isImageChanged = false;

  @override
  void initState() {
    _nameController.text= demoProfileData.name;
    _phoneController.text= demoProfileData.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(builder: (context, provider, child) {


    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.editProfile,
          fontSize: FetchPixels.getPixelHeight(22),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20), vertical: FetchPixels.getPixelHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Stack(children: [
              CircleAvatar(
                radius: FetchPixels.getPixelHeight(80),
                foregroundImage:
                (isImageChanged)?
                FileImage(File(provider.pickedImage!.path))
                :AssetImage(demoProfileData.image) as ImageProvider,
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  height: FetchPixels.getPixelHeight(40),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: R.colors.whiteColor,
                      border: Border.all(
                          color: const Color.fromARGB(255, 208, 201, 201)
                      )),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        provider.pickImage().then((value) => {
                          isImageChanged = value
                        });
                        },
                      icon: const Icon(Icons.mode_edit_outlined)),
                ),
              ),
            ]),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              TextFieldWidget(
                hintText: demoProfileData.name,
                controller: _nameController,
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              Align(
                alignment: Alignment.centerLeft,
                  child: RegularTextWidget(text: 'faizan2002a@gmail.com', fontSize: FetchPixels.getPixelHeight(17), fontWeight: FontWeight.bold,color: R.colors.greyColor,)),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              TextFieldWidget(
                hintText: demoProfileData.phoneNumber,
                controller: _phoneController,
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              ElevatedButton(onPressed: (){
                bool response = provider.updateData(_nameController.text, _phoneController.text);
                if(response){
                  Navigator.pop(context);
                }
              }, child: BoldTextWidget(text: AppTexts.update, color: R.colors.whiteColor,),),
          ],),
        ),
      ),
    );
    },);
  }
}