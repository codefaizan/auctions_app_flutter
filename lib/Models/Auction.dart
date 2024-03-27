// this model is for the auction type items on home-screen and wishlist screen


class AuctionData{
  List<String> images;
  String title;
  String desc;
  String size;
  String year;
  String condition;
  String startingPrice;
  String brand;
  String startDate;
  String endDate;
  String color;
  int rating;
  bool isFav;
  bool isOwner;
  String category;


  AuctionData({
    required this.images,
    required this.title,
    required this.desc,
    required this.size,
    required this.year,
    required this.condition,
    required this.startingPrice,
    required this.brand,
    required this.color,
    required this.rating,
    required this.isFav,
    required this.isOwner,
    required this.startDate,
    required this.endDate,
    required this.category
  });



}

List<AuctionData> demoAuctionList = [
  AuctionData(title: 'Prod1', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$200",
      images: [
        "assets/images/auction-products/item_img_1.png",
        "assets/images/auction-products/item_img_1.png"
      ],
      brand: 'PUMA', color: 'Blue', rating: 3, size: 'Small', year: '2023', condition: 'New', isFav: false, isOwner: false, startDate: '01-04-2024', endDate: '12-05-2024', category: 'Automobile'),

  AuctionData(title: 'Prod2', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$300",
      images: [
        "assets/images/auction-products/item_img_2.png",
        "assets/images/auction-products/item_img_2.png"
      ],
      brand: 'GUCCI', color: 'Green', rating: 4, size: 'Medium', year: '2017', condition: 'Used', isFav: true, isOwner: false, startDate: '15-03-2024', endDate: '20-03-2024', category: 'Books'),

  AuctionData(title: 'Prod3', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$50",
      images: [
        "assets/images/auction-products/item_img_1.png",
        "assets/images/auction-products/item_img_1.png"
      ],
      brand: 'Zara', color: 'Black', rating: 2, size: 'Large', year: '2024', condition: 'New', isFav: false, isOwner: true, startDate: '02-02-2024', endDate: '04-04-2024', category: 'Comics')
];