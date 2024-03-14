import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/Screens/Payment-Screen/views/payment_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/widgets/star_rating_widget.dart';
import 'package:bidding_app/constants/tConstants.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget{
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Align(alignment: Alignment.topLeft ,child: BackButton()),
        toolbarHeight: FetchPixels.getHeightPercentSize(40),
        flexibleSpace: Image.asset('assets/images/auction-products/item_img_3.png', fit: BoxFit.cover,),
        actions: [Align(alignment: Alignment.topRight ,child: IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagesScreen())), icon: Image.asset(AppImages.messageBtnIcon)))],
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTextWidget(text: 'KAWASAKI Ninja H2R', fontSize: FetchPixels.getPixelHeight(19)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const StarsRatingWidget(rating: 4),
              Container(
                height: FetchPixels.getPixelHeight(40),
                width: FetchPixels.getPixelWidth(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (isFavourite) ? defaultThemeColor : Colors.black
                    ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    isFavourite = !isFavourite;
                    setState(() {
                      
                    });
                  }, icon: Icon(Icons.favorite, size: FetchPixels.getPixelHeight(25), color: Colors.white,)))
            ],),
            SizedBox(height: FetchPixels.getPixelHeight(10),),
            Divider(height: FetchPixels.getPixelHeight(10),color: Colors.grey,),
            BoldTextWidget(text: AppTexts.description, fontSize: FetchPixels.getPixelHeight(19)),
            RegularTextWidget(text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i', fontSize: FetchPixels.getPixelHeight(18)),
            SizedBox(height: FetchPixels.getPixelHeight(15)),
            BoldTextWidget(text: AppTexts.price, fontSize: FetchPixels.getPixelHeight(19)),
             BoldTextWidget(text: '€720', fontSize: FetchPixels.getPixelHeight(20)),
            const SizedBox(height: (15),),
            Row(
              children: [
              Column(children: [
                BoldTextWidget(text: AppTexts.brand, fontSize: FetchPixels.getPixelHeight(19)),
                RegularTextWidget(text: 'PUMA', fontSize: FetchPixels.getPixelHeight(20)),
              ],),
              SizedBox(width: 70),
              Column(children: [
                BoldTextWidget(text: AppTexts.color, fontSize: FetchPixels.getPixelHeight(19)),
                RegularTextWidget(text: 'Blue', fontSize: FetchPixels.getPixelHeight(20)),
              ],)
            ],)
            
          ],
        ),),
      ),

      bottomNavigationBar: Container(margin: EdgeInsets.only(left: FetchPixels.getPixelWidth(20), right: FetchPixels.getPixelWidth(20), bottom: FetchPixels.getPixelHeight(15)), child: ElevatedButton(
        onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentScreen())),
        child: BoldTextWidget(text: AppTexts.buyNow))),
    );
  }
}

