import 'package:bidding_app/Screens/Chats-Screen/widgets/chat_tile_widget.dart';
import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.messages,
            fontSize: FetchPixels.getPixelHeight(22)
          ),
          centerTitle: true),
      body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    hintText: AppTexts.search, prefixIcon: Icon(Icons.search_rounded)),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10),),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ChatTileWidget(
                      title: 'Shop Name',
                      subTitle:
                          'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.',
                          hasNewMessage: true,
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: FetchPixels.getPixelHeight(5)); },
                ),
              )
            ],
          )),
    );
  }
}


