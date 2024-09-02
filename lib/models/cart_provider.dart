import 'package:flutter/material.dart';

class ShopItem {
  final String imageUrl;
  final String title;
  final String price;
  final String? description;

  ShopItem(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.description});
}

class CartProvider extends ChangeNotifier {
  List<ShopItem> shopItems = [];

  void addItem(ShopItem item) {
    shopItems.add(item);
    notifyListeners();
  }

  // CartProvider({required List<ShopItem> data}) {
  //   shopItems = data;
  // }

  static ShopItem createShopItem(Map item) {
    return ShopItem(
      title: item['title'].toString(),
      description: item['description'].toString(),
      price: "\$ ${item['price']}",
      imageUrl: item['image'].toString(),
    );
  }

  void clearItems() {
    shopItems.clear();
    notifyListeners();
  }
}
