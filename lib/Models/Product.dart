// this model is for the products type items on home-screen and wishlist screen


class ProductData{
  List<String> images;
  String title;
  String desc;
  String price;
  String brand;
  String color;
  int rating;


  ProductData({
    required this.images,
    required this.title,
    required this.desc,
    required this.price,
    required this.brand,
    required this.color,
    required this.rating
  });

 

}

 List<ProductData> demoProductsList = [
    ProductData(title: 'Product1', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", price: "\$200",
        images: [
          "assets/images/auction-products/item_img_1.png",
          "assets/images/auction-products/item_img_1.png"
        ],
        brand: 'PUMA', color: 'Blue', rating: 3),

    ProductData(title: 'Product2', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", price: "\$300",
        images: [
          "assets/images/auction-products/item_img_2.png",
          "assets/images/auction-products/item_img_2.png"
        ],
        brand: 'GUCCI', color: 'Green', rating: 4),

    ProductData(title: 'Product3', desc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum i", price: "\$50",
        images: [
          "assets/images/auction-products/item_img_1.png",
          "assets/images/auction-products/item_img_1.png"
        ],
        brand: 'Zara', color: 'Black', rating: 2)
  ];