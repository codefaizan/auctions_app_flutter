import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/Screens/New-Product-Screen/views/new_product_screen.dart';
import 'package:bidding_app/Screens/My-Products-Screen/widgets/my_product_item_widget..dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.myProducts,
          fontSize: FetchPixels.getPixelHeight(22),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: FetchPixels.getPixelWidth(12),
            mainAxisSpacing: FetchPixels.getPixelHeight(12),
            mainAxisExtent: FetchPixels.getPixelHeight(250)),
        itemBuilder: (context, index) {
          return MyProductItemWidget(productData: demoProductsList[index],);
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> NewProductScreen())),
        child: Icon(Icons.add, size: FetchPixels.getPixelHeight(35)),
        ),
    );
  }
}

