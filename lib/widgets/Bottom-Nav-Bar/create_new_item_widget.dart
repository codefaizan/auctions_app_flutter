import 'package:bidding_app/Models/Item.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/views/auction_detail_screen.dart';
import 'package:bidding_app/Screens/Home-Screen/Providers/provider.dart';
import 'package:bidding_app/Screens/Home-Screen/widgets/bid_bottom_sheet_widget.dart';
import 'package:bidding_app/Screens/Product-Detail-Screen/views/Product_detail_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewItem extends StatefulWidget {
  final Item item;
  final int itemIndex;
  final ItemCategories itemCategory;
  final dynamic context;

  CreateNewItem(
      {super.key,
      required this.itemIndex,
      required this.itemCategory,
      required this.context,
      required this.item});

  @override
  State<CreateNewItem> createState() => _CreateNewItemState();
}

class _CreateNewItemState extends State<CreateNewItem> {
  bool? isFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => widget.itemCategory == ItemCategories.auctions
                  ? const AuctionDetailScreen()
                  : const ProductDetailScreen())),
      child: Container(
        width: FetchPixels.getPixelWidth(190),
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
                      image: AssetImage(widget.item.itemImg),
                      fit: BoxFit.cover,
                    )),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: FetchPixels.getPixelHeight(32),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFavourite == true
                            ? defaultThemeColor
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoldTextWidget(
                    text: widget.item.itemName,
                    fontSize: FetchPixels.getPixelHeight(17)),
                (widget.itemCategory == ItemCategories.auctions)
                    ? RegularTextWidget(text: '08:45:29')
                    : RegularTextWidget(text: '')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: RegularTextWidget(
                      text: widget.item.itemDesc,
                      overFlow: TextOverflow.fade,
                      maxLines: 2,
                    )),
                BoldTextWidget(
                    text: widget.item.itemPrice,
                    fontSize: FetchPixels.getPixelHeight(16))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  widget.itemCategory == ItemCategories.auctions
                      ? displayBottomSheet(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductDetailScreen()));
                },
                child: (widget.itemCategory == ItemCategories.auctions)
                    ? BoldTextWidget(text: AppTexts.placeBid)
                    : BoldTextWidget(text: AppTexts.buyNow))
          ],
        ),
      ),
    );
  }
}

enum ItemCategories { auctions, products }
