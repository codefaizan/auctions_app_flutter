import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/Screens/My-Products-Screen/providers/provider.dart';
import 'package:bidding_app/Screens/Payment-Screen/views/payment_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/widgets/star_rating_widget.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/resources/resources.dart';

// class ProductDetailScreen extends StatefulWidget{
//
//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.productData});
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return Consumer<productDetailProvider>(builder: (context, value, child) {


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Align(alignment: Alignment.topLeft, child: BackButton()),
        toolbarHeight: FetchPixels.getHeightPercentSize(40),
        flexibleSpace: PageView(
            children: List.generate(
                productData.images.length,
                (index) => Image.asset(
                      productData.images[index],
                      fit: BoxFit.cover,
                    ))),
        // flexibleSpace: Image.asset('assets/images/auction-products/item_img_3.png', fit: BoxFit.cover,),
        actions: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessagesScreen())),
                  icon: Image.asset(AppImages.messageBtnIcon)))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldTextWidget(
                  text: productData.title,
                  fontSize: FetchPixels.getPixelHeight(19)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StarsRatingWidget(rating: productData.rating),
                  Container(
                      height: FetchPixels.getPixelHeight(40),
                      width: FetchPixels.getPixelWidth(40),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (value.isFavourite) ? R.colors.theme : R.colors.blackColor),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            value.toggleFavourite();
                            // setState(() {});
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: FetchPixels.getPixelHeight(25),
                            color: R.colors.whiteColor,
                          )))
                ],
              ),
              SizedBox(
                height: FetchPixels.getPixelHeight(10),
              ),
              Divider(
                height: FetchPixels.getPixelHeight(10),
                color: Colors.grey,
              ),
              BoldTextWidget(
                  text: AppTexts.description,
                  fontSize: FetchPixels.getPixelHeight(19)),
              RegularTextWidget(
                  text: productData.desc,
                  fontSize: FetchPixels.getPixelHeight(18)),
              SizedBox(height: FetchPixels.getPixelHeight(15)),
              BoldTextWidget(
                  text: AppTexts.price,
                  fontSize: FetchPixels.getPixelHeight(19)),
              BoldTextWidget(
                  text: productData.price, fontSize: FetchPixels.getPixelHeight(20)),
              getVerSpace(FetchPixels.getPixelHeight(15)),
              Row(
                children: [
                  Column(
                    children: [
                      BoldTextWidget(
                          text: AppTexts.brand,
                          fontSize: FetchPixels.getPixelHeight(19)),
                      RegularTextWidget(
                          text: productData.brand,
                          fontSize: FetchPixels.getPixelHeight(20)),
                    ],
                  ),
                  getHorSpace(70),
                  Column(
                    children: [
                      BoldTextWidget(
                          text: AppTexts.color,
                          fontSize: FetchPixels.getPixelHeight(19)),
                      RegularTextWidget(
                          text: productData.color,
                          fontSize: FetchPixels.getPixelHeight(20)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              left: FetchPixels.getPixelWidth(20),
              right: FetchPixels.getPixelWidth(20),
              bottom: FetchPixels.getPixelHeight(15)),
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentScreen())),
              child: BoldTextWidget(text: AppTexts.buyNow))),
    );
    },);
  }
}
