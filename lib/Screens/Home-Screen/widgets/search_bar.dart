import 'package:bidding_app/Screens/Filters-Screen/views/filters_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
                trailing: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FiltersScreen()));
                    }, icon: Image.asset(
                    AppImages.filterIcon,
                    height: 60,
                  )),
                  
                ],
                hintText: AppTexts.searchHere,
                hintStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.grey,)),
                backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 231, 228, 228)),
                elevation: const MaterialStatePropertyAll(0),
                padding: MaterialStatePropertyAll(EdgeInsets.only(left: FetchPixels.getPixelWidth(10), top: 0)),
                
              );
  }
}
