import 'package:bidding_app/Screens/Chats-Screen/widgets/chat_tile_widget.dart';
import 'package:bidding_app/Screens/Chats-Screen/Providers/provider.dart';
import 'package:bidding_app/Screens/Messages-Screen/widgets/dismiss_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatelessWidget {
  // final List<ChatOverview> _allUsers=demoChatList;
  // final List<ChatOverview> _filteredUsers=demoChatList;

  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSearching=false;
    return Consumer<ChatsProvider>(builder: (context, value, child) {


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
              TextField(
                onChanged: (searchText) {
                  isSearching=searchText.isNotEmpty?true:false;
                  value.search(searchText);
                },
                decoration: InputDecoration(
                    hintText: AppTexts.search, prefixIcon: Icon(Icons.search_rounded)),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10),),
              Expanded(
                child: ListView.separated(
                  itemCount:
                  (!isSearching)?
                      value.allUsers.length: value.filteredUsers.length,
                  itemBuilder: (context, index) {
                    return dismiss_widget(context, ChatTileWidget(
                        chat:
                        (value.filteredUsers.isEmpty)?
                    value.allUsers[index]: value.filteredUsers[index]), 1);
                  },
                  separatorBuilder: (BuildContext context, int index) { return SizedBox(height: FetchPixels.getPixelHeight(5)); },
                ),
              )
            ],
          )),
    );
    },);
  }
}


