import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/views/auction_detail_screen.dart';
import 'package:bidding_app/Screens/Home-Screen/widgets/bid_bottom_sheet_widget.dart';
import 'package:bidding_app/Screens/Product-Detail-Screen/views/product_detail_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/resources/resources.dart';

class ProductContainerWidget extends StatefulWidget {
  final ProductData productData;
  final int itemIndex;
  final dynamic context;

  ProductContainerWidget(
      {super.key,
        required this.itemIndex,
        required this.context,
        required this.productData});

  @override
  State<ProductContainerWidget> createState() => _AuctionContainerWidgetState();
}

class _AuctionContainerWidgetState extends State<ProductContainerWidget> {
  bool? isFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(productData: widget.productData,))),
      child: Container(

        padding: EdgeInsets.all(FetchPixels.getPixelHeight(7)),
        decoration: BoxDecoration(
            border: Border.all(color: R.colors.borderColor),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: FetchPixels.getPixelHeight(5)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.productData.images[0]),
                      fit: BoxFit.cover,
                    )),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: FetchPixels.getPixelHeight(32),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFavourite == true
                            ? R.colors.theme
                            : R.colors.blackColor),
                    child: IconButton(
                        color: R.colors.whiteColor,
                        padding: EdgeInsets.zero,
                        iconSize: FetchPixels.getPixelHeight(17),
                        onPressed: () {
                          if (isFavourite == true) {
                            isFavourite = false;
                          } else {
                            isFavourite = true;
                          }
                          setState(() {});
                        },
                        icon: const Icon(Icons.favorite)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoldTextWidget(
                    text: widget.productData.title,
                    fontSize: FetchPixels.getPixelHeight(17)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: RegularTextWidget(
                      text: widget.productData.desc,
                      overFlow: TextOverflow.fade,
                      maxLines: 2,
                    )),
                BoldTextWidget(
                    text: widget.productData.price,
                    fontSize: FetchPixels.getPixelHeight(16))
              ],
            ),
            widget.productData.isOwner==false?
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          ProductDetailScreen(productData: widget.productData,)));
                },
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size.fromHeight(FetchPixels.getPixelHeight(38)))
                ),
                child: BoldTextWidget(text: AppTexts.buyNow)):SizedBox()
          ],
        ),
      ),
    );
  }
}

enum ItemCategories { auctions, products }
