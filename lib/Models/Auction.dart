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
  String color;
  int rating;


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
    required this.rating
  });



}

List<AuctionData> demoAuctionList = [
  AuctionData(title: 'Product1', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$200",
      images: [
        "assets/images/auction-products/item_img_1.png",
        "assets/images/auction-products/item_img_1.png"
      ],
      brand: 'PUMA', color: 'Blue', rating: 3, size: 'Small', year: '2023', condition: 'New'),

  AuctionData(title: 'Product2', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$300",
      images: [
        "assets/images/auction-products/item_img_2.png",
        "assets/images/auction-products/item_img_2.png"
      ],
      brand: 'GUCCI', color: 'Green', rating: 4, size: 'Medium', year: '2017', condition: 'Used'),

  AuctionData(title: 'Product3', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", startingPrice: "\$50",
      images: [
        "assets/images/auction-products/item_img_1.png",
        "assets/images/auction-products/item_img_1.png"
      ],
      brand: 'Zara', color: 'Black', rating: 2, size: 'Large', year: '2024', condition: 'New')
];