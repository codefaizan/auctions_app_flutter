import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/Screens/Wishlist-Screen/widgets/empty_wishlist.dart';
import 'package:bidding_app/Screens/Wishlist-Screen/widgets/non_empty_wishlist.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.wishlist,
            fontSize: FetchPixels.getPixelHeight(22),
          ),
          centerTitle: true,
          
        ),
        body: (demoProductsList.isEmpty)
            ?
            // if wishlist is empty then empty screen will be shown, else item of wishlist will be shown
            const EmptyWishlistScreen()
            : NonEmptyWishlistScreen());
  }
}



