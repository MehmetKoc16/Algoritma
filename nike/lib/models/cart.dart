import 'package:flutter/material.dart';
import 'package:nike/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: "Zoom Freak",
        description: "Fires",
        imagePath: "lib/image/pngwing.com (3).png",
        price: "236"),
    Shoe(
        name: "Air Jordan",
        description: "Fires",
        imagePath: "lib/image/pngwing.com (1).png",
        price: "236"),
    Shoe(
        name: "Kyrie 6",
        description: "Fires",
        imagePath: "lib/image/pngwing.com (2).png",
        price: "236"),
    Shoe(
        name: "Goats",
        description: "Fires",
        imagePath: "lib/image/pngwing.com (4).png",
        price: "236"),
  ];
  List<Shoe> userCart = [];
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
