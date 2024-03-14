import 'package:bidding_app/widgets/text_widget.dart';
import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  final String chipName;

  const FilterChipWidget({super.key, required this.chipName});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return 
    FilterChip(label: RegularTextWidget(text: widget.chipName),showCheckmark: false, selected: isSelected ,labelStyle: TextStyle(color: (isSelected)?Colors.white:Colors.black), onSelected: (newValue) {
      isSelected=newValue;
      setState(() {});
    },);
  }
}
