// this model is for the items on homescreen and wishlist screen


class Item{
  String itemName;
  String itemDesc;
  String itemPrice;
  String itemImg;


  Item({
    required this.itemName,
    required this.itemDesc,
    required this.itemPrice,
    required this.itemImg,
  });

 

}

 List<Item> demoItemsList = [
    Item(itemName: 'Product1', itemDesc: "Description prod1 desc desc desc desc erfh iugherh fuhgreh", itemPrice: "\$200", itemImg: "assets/images/auction-products/item_img_1.png"),

    Item(itemName: 'Product2', itemDesc: "Description prod2 desc desc desc desc", itemPrice: "\$300", itemImg: "assets/images/auction-products/item_img_2.png"),

    Item(itemName: 'Product1', itemDesc: "Description prod3 desc desc desc desc", itemPrice: "\$50", itemImg: "assets/images/auction-products/item_img_1.png")
  ];