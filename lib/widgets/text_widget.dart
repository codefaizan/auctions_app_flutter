import 'package:flutter/material.dart';

class RegularTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overFlow;

  RegularTextWidget(
      {super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.maxLines, this.overFlow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: 
      TextStyle(
        fontSize: fontSize, 
        fontWeight: fontWeight,
        fontFamily: 'Glacial',
        color: color,
        ),
        maxLines: maxLines,
        overflow: overFlow,
    );
  }
}

class BoldTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overFlow;

  BoldTextWidget(
      {super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.maxLines, this.overFlow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: 
      TextStyle(
        fontSize: fontSize, 
        fontWeight: fontWeight,
        fontFamily: 'Krona',
        color: color,
        ),
        maxLines: maxLines,
        overflow: overFlow,
    );
  }
}
