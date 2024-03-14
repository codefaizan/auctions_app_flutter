import 'package:bidding_app/Screens/Filters-Screen/widgets/checkbox_tile_widget.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/colorbox_widget.dart';
import 'package:bidding_app/Screens/Filters-Screen/widgets/filterchip_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _rangeValues = const RangeValues(1, 1000);

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
                    activeColor: const Color.fromARGB(255, 226, 133, 2),
                    onChanged: (newValue) {
                      _rangeValues = newValue;
                      setState(() {});
                    }),
                BoldTextWidget(
                  text: AppTexts.categories,
                  fontSize: FetchPixels.getPixelHeight(20)
                ),
                SizedBox(
                  height: FetchPixels.getHeightPercentSize(25),
                  child: GridView.count(
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: FetchPixels.getPixelHeight(7),
                    crossAxisSpacing: FetchPixels.getPixelWidth(7),
                    padding: EdgeInsets.zero,
                     childAspectRatio: FetchPixels.getPixelHeight(3),
                    children: const [
                      FilterChipWidget(chipName: AppTexts.automobile),
                      FilterChipWidget(chipName: AppTexts.books),
                      FilterChipWidget(chipName: AppTexts.comics),
                      FilterChipWidget(chipName: AppTexts.decorations),
                      FilterChipWidget(chipName: AppTexts.family),
                      FilterChipWidget(chipName: AppTexts.leisure),
                      FilterChipWidget(chipName: AppTexts.film),
                      FilterChipWidget(chipName: AppTexts.garden),
                      FilterChipWidget(chipName: AppTexts.house),
                      FilterChipWidget(chipName: AppTexts.musicCD),
                      FilterChipWidget(chipName: AppTexts.houseWork),
                    ],
                  ),
                ),
                BoldTextWidget(
                  text: AppTexts.brands,
                  fontSize: FetchPixels.getPixelHeight(20)
                ),
                const Column(children: [
                  CheckboxTileWidget(checkboxTitle: 'ZARA',),
                  CheckboxTileWidget(checkboxTitle: 'GUCCI',),
                  CheckboxTileWidget(checkboxTitle: 'PUMA',),
                ],),
                
                BoldTextWidget(
                  text: AppTexts.colors,
                  fontSize: FetchPixels.getPixelHeight(20)
                ),
                Wrap(
                  runSpacing: FetchPixels.getPixelHeight(5),
                  spacing: FetchPixels.getPixelWidth(5),
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColorBoxWidget(color: Color(0xFFd9d9d9)),
                    ColorBoxWidget(color: Color(0xFF000000)),
                    ColorBoxWidget(color: Color(0xFFed0006)),
                    ColorBoxWidget(color: Color(0xFF14b11a)),
                    ColorBoxWidget(color: Color(0xFF009cde)),
                    ColorBoxWidget(color: Color(0xFF003087)),
                  ],
                ),
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