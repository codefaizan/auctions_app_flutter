import 'package:bidding_app/Models/ChatMessage.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final ChatMessage message;
  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return 
    Align(
      alignment: message.isSender ? Alignment.centerRight:Alignment.centerLeft,
      child: SizedBox(
        // width: screenWidth/1.3,
        width: FetchPixels.getWidthPercentSize(65),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(10), horizontal: FetchPixels.getPixelWidth(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: message.isSender ? const Radius.circular(16) : const Radius.circular(0),
              topRight: message.isSender ? const Radius.circular(0): const Radius.circular(16),
              bottomLeft: const Radius.circular(16),
              bottomRight: const Radius.circular(16)
              ),
            color: message.isSender ? const Color(0xFFD9D9D9) : const Color(0xFFF1F1F1),
          ),
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft,child: RegularTextWidget(text: message.text,)),
              Align(alignment: Alignment.centerRight, child: RegularTextWidget(text: '02:00pm'))
            ],
          ),
        ),
      ),
    );
    
  }
}
