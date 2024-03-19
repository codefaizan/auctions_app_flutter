import 'dart:io';

import 'package:bidding_app/Screens/New-Product-Screen/provider.dart';
import 'package:bidding_app/Screens/New-Product-Screen/widgets/auction_form_widget.dart';
import 'package:bidding_app/Screens/New-Product-Screen/widgets/product_form_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/resources/theme.dart';
import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class AddNewProductScreen extends StatefulWidget {
//   const AddNewProductScreen({super.key});
//
//   @override
//   State<AddNewProductScreen> createState() => _AddNewProductScreenState();
// }

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewProductProvider>(builder: (pContext, value, child) {


    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
            text: AppTexts.addProduct,
            fontSize: FetchPixels.getPixelHeight(22)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
        child: ListView(
          children: [
            InkWell(
              onTap: () => value.pickImage(),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  height: FetchPixels.getHeightPercentSize(25),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.cameraIcon),
                        RegularTextWidget(text: AppTexts.addImages)
                      ],
                    ),
                  )),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            SizedBox(
              height: (value.pickedImages!.isNotEmpty)?FetchPixels.getHeightPercentSize(15):0,
              child: ListView.builder(
                itemCount: value.pickedImages!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: FetchPixels.getWidthPercentSize(25),
                        margin: EdgeInsets.only(
                            right: FetchPixels.getPixelWidth(10),
                            top: FetchPixels.getPixelHeight(7)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),

                          image: DecorationImage(
                              image: FileImage(File(value.pickedImages![index].path)),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          top: FetchPixels.getPixelHeight(-12),
                          right: FetchPixels.getPixelWidth(-11),
                          child: IconButton(
                            constraints: BoxConstraints.tight(Size.fromRadius(
                                FetchPixels.getPixelHeight(12))),
                            onPressed: () => value.removeImage(index),
                            icon: Image.asset(
                              AppImages.crossBtnIcon,
                            ),
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topRight,
                          ))
                    ],
                  );
                },
              ),
            ),
            SwitchButton(value),
            (value.isAuctionForm) ? const AuctionForm() : const ProductForm(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: FetchPixels.getPixelHeight(20), right: FetchPixels.getPixelHeight(20), bottom: FetchPixels.getPixelHeight(15)),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: BoldTextWidget(
                  text: (value.isAuctionForm)
                      ? AppTexts.placeAuction
                      : AppTexts.addProduct))),
    );
    },);
  }

  Widget SwitchButton(NewProductProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RegularTextWidget(
          text: AppTexts.auction,
          fontSize: FetchPixels.getPixelHeight(19),
        ),
        RotatedBox(
          quarterTurns: 2,
          child: Switch(
              activeColor: defaultThemeColor,
              activeTrackColor: const Color(0xFFF6DAB3),
              inactiveTrackColor: const Color.fromARGB(255, 218, 217, 217),
              inactiveThumbColor: Colors.grey,
              trackOutlineColor: const MaterialStatePropertyAll(Colors.white),
              value: provider.isAuctionForm,
              onChanged: (newValue) {
                provider.changeForm(newValue);
              }),
        ),
      ],
    );
  }
}
