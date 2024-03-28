// this model is for the auction type items on home-screen and wishlist screen


class AuctionData{
  List<String> images;
  String title;
  String desc;
  String startingPrice;
  String minimumPrice;
  String startDate;
  String endDate;
  bool isOwner;
  String category;
  String city;


  AuctionData({
    required this.images,
    required this.title,
    required this.desc,
    required this.startingPrice,
    required this.minimumPrice,
    required this.isOwner,
    required this.startDate,
    required this.endDate,
    required this.category,
    required this.city
  });



}

List<AuctionData> demoAuctionList = [
  AuctionData(title: 'Prod1', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$200",
      images: [
        "assets/images/auction-products/item_img_1.png",
        "assets/images/auction-products/item_img_1.png"
      ],
      isOwner: false, startDate: '01-04-2024', endDate: '12-05-2024', category: 'Automobile', city: 'Bwp', minimumPrice: '\$100'),

  AuctionData(title: 'Prod2', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$300",
      images: [
        "assets/images/auction-products/item_img_2.png",
        "assets/images/auction-products/item_img_2.png"
      ],
      isOwner: false, startDate: '15-03-2024', endDate: '20-03-2024', category: 'Books', city: 'Lahore', minimumPrice: '\$100'),

  AuctionData(title: 'Prod3', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$50",
      images: [
        "assets/images/auction-products/item_img_1.png",
        "assets/images/auction-products/item_img_1.png"
      ],
     isOwner: true, startDate: '02-02-2024', endDate: '04-04-2024', category: 'Comics', city: 'Multan', minimumPrice: '\$100')
];