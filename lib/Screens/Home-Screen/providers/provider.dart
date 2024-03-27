import 'package:bidding_app/Models/Auction.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier{
  List<AuctionData> allAuctions = demoAuctionList;
  List<AuctionData> filteredAuctions = [];

  search(String searchText){
    filteredAuctions.clear();
    if(searchText.isNotEmpty){
      filteredAuctions.addAll(allAuctions.where((element) => element.title.toLowerCase().contains(searchText)).toList());
    }
    notifyListeners();
  }
}