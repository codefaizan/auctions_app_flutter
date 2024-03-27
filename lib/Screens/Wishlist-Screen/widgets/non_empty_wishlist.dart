import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/AuctionContainerWidget.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/resources/theme.dart';
import 'package:bidding_app/widgets/ProductContainerWidget.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/resources/resources.dart';

class NonEmptyWishlistScreen extends StatefulWidget {
  NonEmptyWishlistScreen({super.key});

  @override
  State<NonEmptyWishlistScreen> createState() => _NonEmptyWishlistScreenState();
}

class _NonEmptyWishlistScreenState extends State<NonEmptyWishlistScreen> {
  int currentTab=0;

  @override
  Widget build(BuildContext context) {
    return

      GridView.builder(
        itemCount: demoProductsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: FetchPixels.getPixelHeight(10), mainAxisSpacing: FetchPixels.getPixelHeight(5),
          mainAxisExtent: FetchPixels.getPixelHeight(320),
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return AuctionContainerWidget(auctionData: demoAuctionList[index], itemIndex: index,context: context);
        },
      );
  }
}