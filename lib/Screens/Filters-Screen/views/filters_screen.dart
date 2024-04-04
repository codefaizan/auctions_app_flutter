import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Screens/Filters-Screen/views/filter_results_screen.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/checkbox_tile_widget.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/colorbox_widget.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/filterchip_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _rangeValues = const RangeValues(1, 1000);
  int selectedFilterIndex=-1;

  @override
  Widget build(BuildContext context) {
    RangeLabels rangeLabels =
        RangeLabels(_rangeValues.start.toString(), _rangeValues.end.toString());

    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.filters,
          fontSize: FetchPixels.getPixelHeight(21)
        ),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldTextWidget(
                  text: AppTexts.categories,
                  fontSize: FetchPixels.getPixelHeight(18)
                ),

                getVerSpace(FetchPixels.getPixelHeight(10)),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: FetchPixels.getPixelWidth(5),
                    mainAxisSpacing: FetchPixels.getPixelHeight(5),
                    childAspectRatio: FetchPixels.getPixelHeight(3),
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return
                      OutlinedButton(
                          onPressed: (){
                            selectedFilterIndex = index;
                            setState(() {});
                          },
                          child: RegularTextWidget(text: categories[index],),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: (selectedFilterIndex == index)?Colors.white:Colors.black,
                            backgroundColor: (selectedFilterIndex == index)?R.colors.theme:Colors.white,
                            padding: EdgeInsets.zero,
                            side: BorderSide(color: (selectedFilterIndex == index)?R.colors.theme:R.colors.greyColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                      );
                  },

                ),
            getVerSpace(FetchPixels.getPixelHeight(60)),
            ElevatedButton(onPressed: () {
              List<AuctionData> filteredData = [];
              filteredData.addAll(demoAuctionList.where((element) => element.category.contains(categories[selectedFilterIndex])).toList());
              print(filteredData.length);
              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterResultScreen(filteredData: filteredData),));

            },
              child: BoldTextWidget(text: AppTexts.applyFilters),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> categories = [
  'Automobile',
  'Books',
  'Comics',
  'Decorations',
  'Family',
  'Leisure',
  'Film',
  'Garden',
  'House',
  'Music CD',
  'House Work',
];


