import 'package:bidding_app/Models/Auction.dart';
import 'package:flutter/material.dart';

class AuctionDetailProvider extends ChangeNotifier{
  bool isFavourite = false;

  toggleFavourite(){
    isFavourite = !isFavourite;
    notifyListeners();
  }
}