import 'package:bidding_app/Screens/Filters-Screen/widgets/checkbox_tile_widget.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/colorbox_widget.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/filterchip_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
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
          fontSize: FetchPixels.getPixelHeight(22)
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
                  text: AppTexts.price,
                  fontSize: FetchPixels.getPixelHeight(20),
                ),
                RangeSlider(
                    values: _rangeValues,
                    labels: rangeLabels,
                    divisions: 1000,
                    min: 0,
                    max: 1000,
                    activeColor:  R.colors.theme,
                    onChanged: (newValue) {
                      _rangeValues = newValue;
                      setState(() {});
                    }),
                BoldTextWidget(
                  text: AppTexts.categories,
                  fontSize: FetchPixels.getPixelHeight(20)
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: FetchPixels.getPixelWidth(5),
                    mainAxisSpacing: FetchPixels.getPixelHeight(5),
                    childAspectRatio: FetchPixels.getPixelHeight(4),
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
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                      );
                  },

                ),

                // BoldTextWidget(
                //   text: AppTexts.brands,
                //   fontSize: FetchPixels.getPixelHeight(20)
                // ),
                // const Column(children: [
                //   CheckboxTileWidget(checkboxTitle: 'ZARA',),
                //   CheckboxTileWidget(checkboxTitle: 'GUCCI',),
                //   CheckboxTileWidget(checkboxTitle: 'PUMA',),
                // ],),
                //
                // BoldTextWidget(
                //   text: AppTexts.colors,
                //   fontSize: FetchPixels.getPixelHeight(20)
                // ),
                // Wrap(
                //   runSpacing: FetchPixels.getPixelHeight(5),
                //   spacing: FetchPixels.getPixelWidth(5),
                //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ColorBoxWidget(color: Color(0xFFd9d9d9)),
                //     ColorBoxWidget(color: Color(0xFF000000)),
                //     ColorBoxWidget(color: Color(0xFFed0006)),
                //     ColorBoxWidget(color: Color(0xFF14b11a)),
                //     ColorBoxWidget(color: Color(0xFF009cde)),
                //     ColorBoxWidget(color: Color(0xFF003087)),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: FetchPixels.getPixelWidth(20), right: FetchPixels.getPixelWidth(20), bottom: FetchPixels.getPixelHeight(20)),
        child: ElevatedButton(onPressed: ()=> Navigator.pop(context),
        child: BoldTextWidget(text: AppTexts.applyFilters),),),
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


