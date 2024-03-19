import 'package:bidding_app/Screens/Chats-Screen/demoItems.dart';
import 'package:flutter/material.dart';

class ChatsProvider extends ChangeNotifier {
  List<ChatOverview> allUsers = demoChatList;
  List<ChatOverview> filteredUsers = [];


  search(String searchText){
    filteredUsers.clear();
    if(searchText.isNotEmpty){
      filteredUsers.addAll(allUsers.where((element) => element.title.toLowerCase().contains(searchText)).toList());
    }
    notifyListeners();
  }
}