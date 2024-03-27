import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/views/auction_detail_screen.dart';
import 'package:bidding_app/Screens/New-Product-Screen/views/new_product_screen.dart';
import 'package:bidding_app/Screens/Product-Detail-Screen/views/product_detail_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class MyProductItemWidget extends StatelessWidget {
  const MyProductItemWidget({
    super.key,
    required this.auctionData
  });
  final AuctionData auctionData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuctionDetailScreen(auctionData: auctionData,))),
      
      child: Container(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(8)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: R.colors.greyColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(
                          auctionData.images[0]),
                      fit: BoxFit.cover),
                ),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: getAssetImage(AppImages.editBtnIcon),
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewProductScreen())),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: BoldTextWidget(
                    text: auctionData.title,
                    fontSize: FetchPixels.getPixelHeight(12),
                  ),
                ),
                RegularTextWidget(
                  text: auctionData.endDate,
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: RegularTextWidget(
                    text: auctionData.desc,
                    overFlow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
                BoldTextWidget(
                  text: auctionData.startingPrice,
                  fontSize: FetchPixels.getPixelHeight(12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
