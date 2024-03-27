import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/AuctionContainerWidget.dart';

class FilterResultScreen extends StatelessWidget {
  final List<AuctionData> filteredData;
  const FilterResultScreen({super.key, required this.filteredData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.result,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: FetchPixels.getPixelHeight(20),
            horizontal: FetchPixels.getPixelWidth(20)),
        child: 
            filteredData.isNotEmpty?
        GridView.builder(
          itemCount: filteredData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: FetchPixels.getPixelHeight(260)),
          itemBuilder: (context, index) {
            return AuctionContainerWidget(
              auctionData: filteredData[index],
              itemIndex: index,
              context: context,
            );
          },
        )
                : Center(child: RegularTextWidget(text: AppTexts.noDataAvailable, fontSize: FetchPixels.getPixelHeight(15),))
      ),
    );
  }
}
