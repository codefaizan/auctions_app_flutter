import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/widgets/bids_list_widget.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/widgets/wrap_text_widget.dart';
import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/star_rating_widget.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/resources/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class AuctionDetailScreen extends StatelessWidget {
  AuctionDetailScreen({super.key, required this.auctionData});
  final AuctionData auctionData;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        forceMaterialTransparency: true,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(height: FetchPixels.getHeightPercentSize(40),
                  child: PageView(children: List.generate(auctionData.images.length, (index) => Image.asset(auctionData.images[index], fit: BoxFit.cover,))
                  )),
              Positioned(
                bottom: -0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(30), vertical: FetchPixels.getPixelHeight(2)),
                  width: FetchPixels.getWidthPercentSize(80),
                  height: FetchPixels.getHeightPercentSize(7.5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7)),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          BoldTextWidget(
                              text: '€720',
                              fontSize: FetchPixels.getPixelHeight(19)),
                          RegularTextWidget(text: AppTexts.currentBid)
                        ],
                      ),
                      Column(
                        children: [
                          BoldTextWidget(
                            text: '08:45:29',
                            fontSize: FetchPixels.getPixelHeight(19),
                          ),
                          RegularTextWidget(text: AppTexts.auctionEnds),
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
                    BoldTextWidget(
                        text: auctionData.title,
                        fontSize: FetchPixels.getPixelHeight(19)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const StarsRatingWidget(
                          rating: 3,
                        ),
                        Container(
                            height: FetchPixels.getPixelHeight(40),
                            width: FetchPixels.getPixelWidth(40),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (isFavourite)
                                    ? defaultThemeColor
                                    : Colors.black),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  isFavourite = !isFavourite;
                                  // setState(() {});
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: FetchPixels.getPixelHeight(25),
                                  color: Colors.white,
                                )))
                      ],
                    ),
                    SizedBox(height: FetchPixels.getPixelHeight(10)),
                    Divider(height: FetchPixels.getPixelHeight(10), color: Colors.grey),
                    BoldTextWidget(text: AppTexts.description, fontSize: FetchPixels.getPixelHeight(19)),
                    TextWrapWidget(
                        text: auctionData.desc),
                    SizedBox(
                      height: FetchPixels.getPixelHeight(15),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            BoldTextWidget(text: AppTexts.brand, fontSize: FetchPixels.getPixelHeight(19)),
                            RegularTextWidget(
                              text: auctionData.brand,
                              // fontSize: FetchPixels.getPixelHeight(18),
                            )
                          ],
                        ),
                        SizedBox(width: FetchPixels.getPixelWidth(70)),
                        Column(
                          children: [
                            BoldTextWidget(text: AppTexts.color, fontSize: FetchPixels.getPixelHeight(19)),
                            RegularTextWidget(text: auctionData.color,
                            // fontSize: FetchPixels.getPixelHeight(18)
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15)),
                      padding: EdgeInsets.all(FetchPixels.getPixelHeight(8)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              BoldTextWidget(text: auctionData.condition, fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.condition)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(text: auctionData.year, fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.year)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(text: auctionData.size, fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.size)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(text: auctionData.startingPrice, fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.startingPrice)
                            ],
                          ),
                        ],
                      ),
                    ),
                    BoldTextWidget(text: AppTexts.bids, fontSize: FetchPixels.getPixelHeight(19)),
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
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: FetchPixels.getPixelWidth(20), right: FetchPixels.getPixelWidth(20), bottom: FetchPixels.getPixelHeight(15)),
          child: ElevatedButton(
              onPressed: () {},
              child: BoldTextWidget(text: AppTexts.placeBid))),
    );
  }
}
