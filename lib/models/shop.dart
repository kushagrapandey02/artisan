import 'package:flutter/material.dart';
import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  //list of drinks for sale
  final List<Drink> _shop = [
    //pearl milk tea
    Drink(
      name: "Charlie Puth",
      price: "4.00",
      imagePath: "lib/images/milk_tea.png",
    ),
  ];

  // list of drinks in user cart
  final List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addtoCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removefromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
