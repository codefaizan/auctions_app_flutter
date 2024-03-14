import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class StarsRatingWidget extends StatelessWidget {
  final int rating;
  const StarsRatingWidget({
    super.key,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> starsList = [];
    for (var i = 0; i < 5; i++) {
      starsList.add(Icon(
        Icons.star,
        color: (i<rating)?defaultThemeColor:Colors.grey));
    }
    starsList.add(RegularTextWidget(text: '  $rating', fontSize: 17));
    return Row(children: starsList,);
  }
}