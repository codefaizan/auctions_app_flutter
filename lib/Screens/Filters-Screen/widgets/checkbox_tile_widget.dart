import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CheckboxTileWidget extends StatefulWidget {
  final String checkboxTitle;
  const CheckboxTileWidget({
    super.key,
    required this.checkboxTitle
  });

  @override
  State<CheckboxTileWidget> createState() => _CheckboxTileWidgetState();
}

class _CheckboxTileWidgetState extends State<CheckboxTileWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
    value: isSelected,
    contentPadding: const EdgeInsets.only(left: 0),
    
    onChanged: (newValue) {
      isSelected=newValue!;
      setState(() {});
    },
    
    title: RegularTextWidget(text: widget.checkboxTitle),
    
    controlAffinity: ListTileControlAffinity.leading,
                  );
  }
}