import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
            name: 'Air Jordan',
            price: '\$240',
            description: 'Take things to the next level',
            imagePath: 'images/Air Jordan.jpg',
            ),

    Shoe(
      name: 'Nike Zoom',
      price: '\$236',
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'images/Nike Zoom.jpg',
      ),

      Shoe(
      name: 'Nike Kyrie',
      price: '\$300',
      description: 'Simple but Stylish.',
      imagePath: 'images/Nike Kyrie.jpg',
      ),

      Shoe(
            name: 'KDTREY',
            price: '\$350',
            description: 'You have come looking for the best and you have got one.',
            imagePath: 'images/KDTREY.jpg',
            ),

  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of items for sales
  List<Shoe> getShoeList(){
    return shoeShop;
    }

  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }
  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item form cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}