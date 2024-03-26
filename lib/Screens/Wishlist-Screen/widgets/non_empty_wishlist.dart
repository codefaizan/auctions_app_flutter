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
    
    Container(
        child: DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Material(
            child: TabBar(
              onTap: (value) {
                currentTab = value;
                setState(() {
                  
                });
              },
              
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: R.colors.theme,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const ClampingScrollPhysics(),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                tabs: [
                  Tab(
                    child: Container(
                      //height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (currentTab == 1)?const Color(0xFFD9D9D9):null,
                          ),
                      child: Align(
                        alignment: Alignment.center,
                        child: BoldTextWidget(
                          text: AppTexts.auctions,
                          fontSize: FetchPixels.getPixelHeight(17)
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (currentTab == 0)?const Color(0xFFD9D9D9):null,
                          ),
                      child: Align(
                        alignment: Alignment.center,
                        child: BoldTextWidget(
                          text: AppTexts.products,
                          fontSize: FetchPixels.getPixelHeight(17)
                        ),
                      ),
                    ),
                  )
                ]),
          ),
          Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
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
            ),
            GridView.builder(
              itemCount: demoProductsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: FetchPixels.getPixelHeight(10), mainAxisSpacing: FetchPixels.getPixelHeight(5),
                mainAxisExtent: FetchPixels.getPixelHeight(320),
                  crossAxisCount: 2,  
                  ),
              itemBuilder: (context, index) {
                return ProductContainerWidget(productData: demoProductsList[index], itemIndex: index, context: context);
              },
            ),
          ]))
        ],
      ),
    ));
  }
}