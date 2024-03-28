import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/providers/provider.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/widgets/bids_list_widget.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/widgets/wrap_text_widget.dart';
import 'package:bidding_app/Screens/Home-Screen/widgets/bid_bottom_sheet_widget.dart';
import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/star_rating_widget.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/resources/resources.dart';

class AuctionDetailScreen extends StatelessWidget {
  const AuctionDetailScreen({super.key, required this.auctionData});
  final AuctionData auctionData;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuctionDetailProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            actions: auctionData.isOwner
                ? null
                : [
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MessagesScreen())),
                            icon: Image.asset(AppImages.messageBtnIcon)))
                  ],
            forceMaterialTransparency: true,
          ),
          extendBodyBehindAppBar: true,
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: FetchPixels.getHeightPercentSize(40),
                      child: PageView(
                          children: List.generate(
                              auctionData.images.length,
                              (index) => Image.asset(
                                    auctionData.images[index],
                                    fit: BoxFit.cover,
                                  )))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: FetchPixels.getPixelHeight(310)),
                      padding: EdgeInsets.symmetric(
                          horizontal: FetchPixels.getPixelWidth(30),
                          vertical: FetchPixels.getPixelHeight(2)),
                      height: FetchPixels.getHeightPercentSize(7.5),
                      decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(blurRadius: 1)],
                          border: Border.all(color: R.colors.greyColor),
                          borderRadius: BorderRadius.circular(7),
                          color: R.colors.whiteColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              BoldTextWidget(
                                  text: auctionData.startDate,
                                  fontSize: FetchPixels.getPixelHeight(14)),
                              RegularTextWidget(text: AppTexts.startDate)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(
                                text: auctionData.endDate,
                                fontSize: FetchPixels.getPixelHeight(14),
                              ),
                              RegularTextWidget(text: AppTexts.endDate),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: FetchPixels.getPixelHeight(10),
                        horizontal: FetchPixels.getPixelWidth(25)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldTextWidget(
                                text: auctionData.title,
                                fontSize: FetchPixels.getPixelHeight(19)),
                            Container(
                                height: FetchPixels.getPixelHeight(43),
                                width: FetchPixels.getPixelWidth(43),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (value.isFavourite)
                                        ? R.colors.theme
                                        : R.colors.borderColor),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      value.toggleFavourite();
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      size: FetchPixels.getPixelHeight(25),
                                      color: R.colors.whiteColor,
                                    )))
                          ],
                        ),
                        SizedBox(height: FetchPixels.getPixelHeight(10)),
                        Divider(
                            height: FetchPixels.getPixelHeight(10),
                            color: R.colors.greyColor),
                        BoldTextWidget(
                            text: AppTexts.description,
                            fontSize: FetchPixels.getPixelHeight(19)),
                        TextWrapWidget(text: auctionData.desc),
                        SizedBox(
                          height: FetchPixels.getPixelHeight(15),
                        ),
                        BoldTextWidget(
                            text: AppTexts.city,
                            fontSize: FetchPixels.getPixelHeight(19)),
                        RegularTextWidget(
                            text: auctionData.city,
                            fontSize: FetchPixels.getPixelHeight(18)),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: FetchPixels.getPixelHeight(15)),
                          padding:
                              EdgeInsets.all(FetchPixels.getPixelHeight(8)),
                          decoration: BoxDecoration(
                              border: Border.all(color: R.colors.greyColor),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  BoldTextWidget(
                                      text: auctionData.startingPrice,
                                      fontSize: FetchPixels.getPixelHeight(19)),
                                  RegularTextWidget(text: AppTexts.actualPrice, fontSize: FetchPixels.getPixelHeight(18))
                                ],
                              ),
                              Column(
                                children: [
                                  BoldTextWidget(
                                      text: auctionData.minimumPrice,
                                      fontSize: FetchPixels.getPixelHeight(19)),
                                  RegularTextWidget(
                                      text: AppTexts.currentPrice,
                                      fontSize: FetchPixels.getPixelHeight(18))
                                ],
                              ),
                            ],
                          ),
                        ),
                        BoldTextWidget(
                            text: AppTexts.bids,
                            fontSize: FetchPixels.getPixelHeight(19)),
                        Flexible(
                            fit: FlexFit.loose,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const BidsListWidget();
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: auctionData.isOwner
              ? null
              : Container(
                  margin: EdgeInsets.only(
                      left: FetchPixels.getPixelWidth(20),
                      right: FetchPixels.getPixelWidth(20),
                      bottom: FetchPixels.getPixelHeight(15)),
                  child: ElevatedButton(
                      onPressed: () {
                        displayBottomSheet(context);
                      },
                      child: BoldTextWidget(text: AppTexts.placeBid))),
        );
      },
    );
  }
}
