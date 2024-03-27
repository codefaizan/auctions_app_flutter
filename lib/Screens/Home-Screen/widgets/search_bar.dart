import 'package:bidding_app/Screens/Filters-Screen/views/filters_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(this.onChanged);
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
                trailing: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FiltersScreen()));
                    }, icon: getAssetImage(
                    AppImages.filterIcon,
                    boxFit: BoxFit.cover,
                    height: FetchPixels.getPixelHeight(77),
                  ),
                  ),
                  
                ],
                hintText: AppTexts.searchHere,
                hintStyle: MaterialStatePropertyAll(TextStyle(color: R.colors.hintText,)),
                backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 231, 228, 228)),
                elevation: const MaterialStatePropertyAll(0),
                padding: MaterialStatePropertyAll(EdgeInsets.only(left: FetchPixels.getPixelWidth(10), top: 0)),
      onChanged: onChanged,
              );
  }
}
