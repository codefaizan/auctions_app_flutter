import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/views/auction_detail_screen.dart';
import 'package:bidding_app/Screens/Home-Screen/widgets/bid_bottom_sheet_widget.dart';
import 'package:bidding_app/Screens/Product-Detail-Screen/views/product_detail_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../Models/Auction.dart';
import '../base/resources/resources.dart';

class AuctionContainerWidget extends StatefulWidget {
  final AuctionData auctionData;
  final int itemIndex;
  final dynamic context;

  AuctionContainerWidget(
      {super.key,
      required this.itemIndex,
      required this.context,
      required this.auctionData});

  @override
  State<AuctionContainerWidget> createState() => _AuctionContainerWidgetState();
}

class _AuctionContainerWidgetState extends State<AuctionContainerWidget> {
  bool? isFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AuctionDetailScreen(auctionData: widget.auctionData,))),
      child: Container(
        width: FetchPixels.getPixelWidth(230),
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(7)),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 202, 200, 200)),
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
                      image: AssetImage(widget.auctionData.images[0]),
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
                            : Colors.black),
                    child: IconButton(
                        color: Colors.white,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldTextWidget(
                    text: widget.auctionData.title,
                    fontSize: FetchPixels.getPixelHeight(15)),
                RegularTextWidget(text: '08:45:29')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: RegularTextWidget(
                      text: widget.auctionData.desc,
                      overFlow: TextOverflow.fade,
                      maxLines: 2,
                    )),
                getHorSpace(FetchPixels.getPixelWidth(5)),
                BoldTextWidget(
                    text: widget.auctionData.startingPrice,
                    fontSize: FetchPixels.getPixelHeight(15))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  displayBottomSheet(context);
                },
                child: BoldTextWidget(text: AppTexts.placeBid))
          ],
        ),
      ),
    );
  }
}
