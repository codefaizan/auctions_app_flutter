import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class BidsListWidget extends StatelessWidget {
  const BidsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(10)),
      decoration: BoxDecoration(
      border: Border.all(color: R.colors.greyColor),
      borderRadius: BorderRadius.circular(12)
    ),
      child: ListTile(
        leading: const CircleAvatar(
        radius: 35,
        foregroundImage: AssetImage('assets/images/profile_img.png')),
        title: BoldTextWidget(text: 'Customer Name', fontSize: FetchPixels.getPixelHeight(14),),
        subtitle: RegularTextWidget(text: '45min ago'),
        trailing: BoldTextWidget(text: '€750', fontSize:  FetchPixels.getPixelHeight(15)),
      ),
    );
  }
}