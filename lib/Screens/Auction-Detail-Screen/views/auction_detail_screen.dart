import 'package:bidding_app/Screens/Auction-Detail-Screen/widgets/bids_list_widget.dart';
import 'package:bidding_app/Screens/Auction-Detail-Screen/widgets/wrap_text_widget.dart';
import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/star_rating_widget.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/constants/tConstants.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AuctionDetailScreen extends StatefulWidget {
  const AuctionDetailScreen({super.key});

  @override
  State<AuctionDetailScreen> createState() => _AuctionDetailScreenState();
}

class _AuctionDetailScreenState extends State<AuctionDetailScreen> {
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
          Container(
            height: FetchPixels.getHeightPercentSize(40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/auction-products/item_img_3.png'),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(30), vertical: FetchPixels.getPixelHeight(2)),
              width: FetchPixels.getWidthPercentSize(80),
              height: FetchPixels.getHeightPercentSize(7.5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7)),
                  color: Colors.white),
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
                        text: 'KAWASAKI Ninja H2R',
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
                                  setState(() {});
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
                    const TextWrapWidget(
                        text:
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i'),
                    SizedBox(
                      height: FetchPixels.getPixelHeight(15),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            BoldTextWidget(text: AppTexts.brand, fontSize: FetchPixels.getPixelHeight(19)),
                            RegularTextWidget(
                              text: 'PUMA',
                              // fontSize: FetchPixels.getPixelHeight(18),
                            )
                          ],
                        ),
                        SizedBox(width: FetchPixels.getPixelWidth(70)),
                        Column(
                          children: [
                            BoldTextWidget(text: AppTexts.color, fontSize: FetchPixels.getPixelHeight(19)),
                            RegularTextWidget(text: 'Blue',
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
                              BoldTextWidget(text: 'New', fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.condition)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(text: '2023', fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.year)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(text: 'Small', fontSize: FetchPixels.getPixelHeight(19)),
                              RegularTextWidget(text: AppTexts.size)
                            ],
                          ),
                          Column(
                            children: [
                              BoldTextWidget(text: '€720', fontSize: FetchPixels.getPixelHeight(19)),
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
