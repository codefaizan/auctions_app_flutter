import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

class ColorBoxWidget extends StatelessWidget {
  const ColorBoxWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: FetchPixels.getPixelHeight(55),
        maxWidth: FetchPixels.getPixelWidth(55),
      ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}